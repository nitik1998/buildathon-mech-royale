# mechfight bot. Standard library only. Runs on PyPy: the decision loop is pure Python, and on the
# scoring machines CPython was slow enough that our cover and path searches were cut short.
FROM pypy:3.11-slim-bookworm
WORKDIR /bot
COPY mechfight.py world.py base.py bot.py ./
RUN chmod -R a+rX /bot
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
USER 65534:65534
ENTRYPOINT ["pypy3", "-u", "/bot/bot.py"]
