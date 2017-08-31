import os

c = get_config()

c.JupyterHub.authenticator_class = 'ldapauthenticator.LDAPAuthenticator' 
c.LDAPAuthenticator.server_address = '10.6.91.26' 
c.LDAPAuthenticator.bind_dn_template = 'uid={username},dc=cm,dc=cluster'
c.LDAPAuthenticator.use_ssl = False
c.JupyterHub.confirm_no_ssl = True
c.LDAPAuthenticator.server_port = 389
c.PAMAuthenticator.open_sessions = False

# KUBERNETES ----------------------------------

c.JupyterHub.spawner_class = 'kubespawner.KubeSpawner'
c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'
c.KubeSpawner.start_timeout = 60 * 10**10
c.Spawner.http_timeout = 60 * 10**10

c.KubeSpawner.singleuser_image_spec = '10.6.91.18:5000/jupyterhub/systemuser:latest'
#c.KubeSpawner.singleuser_image_spec = 'jupyterhub/singleuser:0.8'
c.KubeSpawner.singleuser_image_pull_policy = 'Always'
c.KubeSpawner.hub_connect_ip = '10.100.0.2'


c.KubeSpawner.environment = { 
        'HOME': lambda spawner: '/home/'+str(spawner.user.name),
        'USER': lambda spawner: spawner.user.name ,
        'NOTEBOOK_DIR': lambda spawner: '/home/'+ str(spawner.user.name)
}

c.KubeSpawner.volume_mounts = [{
    'name': '{username}',
    'mountPath': '/home/{username}'
}]

c.KubeSpawner.volumes = [{
    'name': '{username}',
    'hostPath': {
       'path': '/mnt/lustrefs/users/home/{username}'
    }
        
}]
c.KubeSpawner.namespace = "jovial"
c.JupyterHub.extra_log_file = '/var/log/jupyterhub'
c.JupyterHub.cleanup_servers = True

