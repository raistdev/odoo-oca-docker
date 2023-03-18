FROM debian:buster-slim
LABEL author: raistdev

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dirmngr \
        fonts-noto-cjk \
        gnupg \
        libssl-dev \
        node-less \
        npm \
        python3-num2words \
        python3-pdfminer \
        python3-pip \
        python3-phonenumbers \
        python3-pyldap \
        python3-qrcode \
        python3-renderpm \
        python3-setuptools \
        python3-slugify \
        python3-vobject \
        python3-watchdog \
        python3-xlrd \
        python3-xlwt \
        xz-utils \
        python3-acme \
        python3-aiohttp \
        python3-appdirs \
        python3-argcomplete \
        python3-asn1crypto \
        python3-astor \
        python3-boto3 \
        python3-cached-property \
        python3-cachetools \
        python3-certifi \
        python3-cffi \
        python3-chardet \
        python3-charset-normalizer \
        python3-click \
        python3-colorama \
        python3-cryptography \
        python3-cssselect \
        python3-cssutils \
        python3-cycler \
        python3-dateparser \
        python3-decorator \
        python3-defusedxml \
        python3-dicttoxml \
        python3-dnspython \
        python3-docutils \
        python3-elasticsearch \
        python3-elementpath \
        python3-email-validator \
        python3-et-xmlfile \
        python3-feedparser \
        python3-freezegun \
        python3-future \
        python3-genshi \
        python3-gevent \
        python3-greenlet \
        python3-html2text \
        python3-idna \
        python3-importlib-metadata \
        python3-iso8601 \
        python3-isodatetime \
        python3-jdcal \
        python3-jinja2 \
        python3-josepy \
        python3-kiwisolver \
        python3-libsass \
        python3-lxml \
        python3-mako \
        python3-markupsafe \
        python3-matplotlib \
        python-mpld3 \
        python3-multidict \
        python3-mypy-extensions \
        python3-numpy \
        python3-odoorpc \
        python3-ofxparse \
        python3-olefile \
        python3-openpyxl \
        python3-packaging \
        python3-pandas \
        python3-paramiko \
        python3-passlib \
        python3-pathspec \
        python3-pbr \
        python3-pkgconfig \
        python3-platformdirs \
        python3-plotly \
        python3-polib \
        python3-psutil \
        python3-psycopg2 \
        python3-pyasn1-modules \
        python3-pyasn1 \
        python3-pycodestyle \
        python3-pycountry \
        python3-pycparser \
        python3-pycryptodome \
        python3-pydot \
        python3-pyftpdlib \
        python3-pygments \
        python3-pyparsing \
        python3-pypdf2 \
        python3-pysaml2 \
        python3-dateutil \
        python3-jose \
        python3-stdnum \
        python3-pyzbar \
        python3-reportlab \
        python3-requests-file \
        python3-requests \
        python3-soupsieve \
        python3-tenacity \
        python3-toml \
        python3-tomli \
        python3-tornado \
        python3-typed-ast \
        python3-typing-extensions \
        python3-tzlocal \
        python3-unicodecsv \
        python3-unidecode \
        python3-urllib3 \
        validators \
        python3-vatnumber \
        python3-werkzeug \
        python3-wrapt \
        python3-xlsxwriter \
        python3-xmlschema \
        python3-xmlsec \
        python3-xmltodict \
        python3-yarl \
        python3-zeep \
        python3-zipp \
        python3-zxcvbn \

    && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb \
    && echo 'ea8277df4297afc507c61122f3c349af142f31e5 wkhtmltox.deb' | sha1sum -c - \
    && apt-get install -y --no-install-recommends ./wkhtmltox.deb \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
    && pip install \
    -e git+https://github.com/apache/chemistry-cmislib.git@43877b3f078f9ece758ae287c6e21009a8fff5a2#egg=cmislib \
    algoliasearch==2.5.0 \
    attrs==21.2.0 \
    Avalara==21.6.0 \
    Babel==2.6.0 \
    bcrypt==3.2.0 \
    beautifulsoup4==4.9.3 \
    black==22.6.0 \
    bokeh==2.3.1 \
    compressed-rtf==1.0.6 \
    cubiscan==0.0.3 \
    dataclasses==0.8 \
    ebaysdk==2.1.5 \
    ebcdic==1.1.1 \
    endesive \
    extract-msg==0.28.7 \
    factur-x==2.3 \
    IMAPClient==2.1.0 \
    invoice2data \
    mock==2.0.0 \
    numpy-financial==1.0.0 \
    odfpy==1.4.1 \
    odoo-test-helper==1.1.0 \
    openupgradelib==2.0.0 \
    ovh \
    pdf2image==1.16.0 \
    pdfplumber \
    Pillow==8.1.1  \
    pkg_resources==0.0.0 \
    premailer==3.10.0 \
    py3o.formats==0.3 \
    py3o.template==0.10.0 \
    pycrypto==2.6.1 \
    pygount==1.2.4 \
    pyjon.utils==0.7 \
    pyjwt \
    PyNaCl==1.4.0 \
    pyOpenSSL==20.0.1 \
    PyPDF4==1.27.0 \
    pyRFC3339==1.1 \
    pyserial==3.4 \
    pysftp==0.2.9 \
    python_slugify \
    python-barcode==0.14.0 \
    python-ldap==3.1.0 \
    python-magic \
    pytz==2019.1 \
    pyusb==1.0.2 \
    PyYAML==5.4.1 \
    raven==6.10.0 \
    regex \
    requests-pkcs12==1.10 \
    requests-toolbelt==0.9.1 \
    roulier \
    sentry_sdk \
    six==1.16.0 \
    suds-py3==1.4.4.1 \
    vcrpy-unittest==0.1.7 \
    vcrpy==4.1.1 \
    Xmlsig==0.1.5


# install latest postgresql-client
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
    && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
    && gpg --batch --armor --export "${repokey}" > /etc/apt/trusted.gpg.d/pgdg.gpg.asc \
    && gpgconf --kill all \
    && rm -rf "$GNUPGHOME" \
    && apt-get update  \
    && apt-get install --no-install-recommends -y postgresql-client \
    && rm -f /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install rtlcss (on Debian buster)
RUN npm install -g rtlcss

# Install Odoo
ENV ODOO_VERSION 14.0
ARG ODOO_RELEASE=20230317
ARG ODOO_SHA=4b677e345f13d6421d78f6a3f3dce4ccf6bd2a99
RUN curl -o odoo.deb -sSL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
    && echo "${ODOO_SHA} odoo.deb" | sha1sum -c - \
    && apt-get update \
    && apt-get -y install --no-install-recommends ./odoo.deb \
    && rm -rf /var/lib/apt/lists/* odoo.deb

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/

# Set permissions and Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
RUN chown odoo /etc/odoo/odoo.conf \
    && mkdir -p /mnt/extra-addons \
    && chown -R odoo /mnt/extra-addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
EXPOSE 8069 8071 8072

# Set the default config file
ENV ODOO_RC /etc/odoo/odoo.conf

COPY wait-for-psql.py /usr/local/bin/wait-for-psql.py

# Set default user when running the container
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
