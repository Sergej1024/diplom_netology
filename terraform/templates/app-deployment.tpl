apiVersion: apps/v1
kind: Deployment
metadata:
  name: diplom-test-app
  labels:
    app.kubernetes.io/name: diplom-test-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app.kubernetes.io/name: diplom-test-app
  template:
    metadata:
      labels:
        app.kubernetes.io/name: diplom-test-app
    spec:
      containers:
      - name: diplom-test-app
        image: ${login}/diplom-test-app:latest
        ports:
        - containerPort: 80