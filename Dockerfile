FROM ghcr.io/shoppal-ai/llm-base:latest

LABEL maintainer="Guangbin Zhu <zhuguangbin@shoppal.ai>"

COPY lm_eval/ /workspace/lm_eval/
COPY scripts/ /workspace/scripts/
COPY templates/ /workspace/templates/
COPY tests/ /workspace/tests/
COPY examples /workspace/examples/
COPY requirements.txt /workspace/requirements.txt
COPY pyproject.toml /workspace/pyproject.toml
COPY setup.py /workspace/setup.py
COPY mypy.ini /workspace/mypy.ini

WORKDIR /workspace
RUN $MAMBA_DEFAULT_RUN $PIP_INSTALL -r requirements.txt
RUN $MAMBA_DEFAULT_RUN $PIP_INSTALL -e ".[zeno]"
ARG EXTRA
RUN $MAMBA_DEFAULT_RUN $PIP_INSTALL -e ".[${EXTRA}]"
