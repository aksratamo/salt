windows_apps:
  pkg.installed:
    - pkgs:
      - npp
      - chocolatey

choco:
  chocolatey.installed:
      - name: autohotkey 
