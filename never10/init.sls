{%- set os = grains['os'] -%}
{% if os == 'Windows' %}
never10-exe:
  file.managed:
    - name: c:\alkivi\never10.exe
    - source: https://www.grc.com/files/never10.exe
    - source_hash: md5=155bae581ef68e8ee19709cf519035a3
    - makedirs: True

never10-command: 
  cmd.run: 
    - name: ./never10.exe update delete disable
    - cwd: c:\alkivi\
    - shell: powershell
    - require: 
      - file: c:\alkivi\never10.exe
{% endif %}
