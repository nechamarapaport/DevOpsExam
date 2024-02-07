FROM python:3

WORKDIR /app

 RUN apt update
 RUN apt install -y curl
 RUN curl -sL https://netfree.link/dl/unix-ca.sh | sh
 RUN pip config set global.cert /usr/lib/ssl/certs/ca-certificates.crt

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY convert_image_to_pdf ./

ENTRYPOINT ["python", "convert_image_to_pdf.py"]







