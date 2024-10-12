FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install required system packages
RUN DEBIAN_FRONTEND=noninteractive apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    curl \
    wget \
    && DEBIAN_FRONTEND=noninteractive apt clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip && \
    pip install jupyter \
    scikit-learn \
    numpy \
    pandas \
    scipy \
    matplotlib \
    seaborn

# Create a directory for the notebooks
WORKDIR /app

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
