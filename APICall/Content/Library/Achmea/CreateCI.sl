namespace: Achmea
flow:
  name: CreateCI
  inputs:
    - CIType
    - businessApplication
  workflow:
    - db_edit:
        do:
          Achmea.Shared.Micro-Focus.uCMDB.Subflow.createObjectUCMDB:
            - ciType: '${CIType}'
            - prop: name
            - prop1: '${businessApplication}'
            - input_0: null
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      db_edit:
        x: 360
        'y': 80
        navigate:
          2fe15ce3-48e8-c7ba-ff88-37bf8fcfface:
            targetId: 81e3a5ad-8cf9-7ee9-b3ff-a79dcd928b86
            port: SUCCESS
    results:
      SUCCESS:
        81e3a5ad-8cf9-7ee9-b3ff-a79dcd928b86:
          x: 840
          'y': 160
