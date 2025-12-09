Return-Path: <SRS0=VQB9=6P=fours-fze.com=commercial3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99DCD3B7EA
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF1B3C113D0; Tue,  9 Dec 2025 09:56:26 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC63FC4CEF5
	for <linux-firmware@kernel.org>; Tue,  9 Dec 2025 09:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC63FC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee05b2b1beso49495131cf.2
        for <linux-firmware@kernel.org>; Tue, 09 Dec 2025 01:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1765274184; x=1765878984; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q+ghXVAla17ujX/zihLw2XVXIhN/EPbweFtJuRBaoGo=;
        b=oAjtHgO6HllOR94rbLrur5epsHeweRaczaqecD67FQDD7J/Ng6lezmtlLaL0WG/0xX
         W/yHSaAn3XI2T4ojja2xxTdp6yGvnA6qf9WmLxRUl9s5Yj7Rtx9CQTZiVm0ST+ROAGIk
         igz4ijGZUv8sjNOEjdUiQ6L8/NdhHSNWAW27VKmHu6GJxkj+Ku3/hPZW3bYlVK0E4ymJ
         JtmBnXl2ZN8UgK2LtGu1gATLLUWYEcPvdSOa89bsXpBp+b+e/JfZduJd2eR7iDBa05uk
         78jM4U7fgeLUX+jQOU4uTwnY5xGrKBLMkpfHPHoznBZFJvpeT/sdD3iD6osi5QtZWunY
         mN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274184; x=1765878984;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+ghXVAla17ujX/zihLw2XVXIhN/EPbweFtJuRBaoGo=;
        b=wHRkSJ1rxL/D5f7sRLofNoJlPqpBHMKBDFgufu3yruTPnIE2fwOLbTqpxa8iHdPKyt
         ZIoXvTUi33N7x4B3+ZPetKH+UopAsMPWJ6aqHTw6OlMf1tDUljHnGs4eBE3yqPDQCC6j
         M0LS9ihzncQWjzbauhjBDMPbWNgYo/LTn9iXWzVoFMryANpcBmNZ5TyMwEwOmQX8bDgb
         HPZnz+uJsYNRWjdmOCDSrjvPLKfSNCC5UqrIXfkqfg9TBiqQX/SWFDwqgMVbw6pcH8Bx
         l8KTSk2VDv2rixG4dD1em/E1W5RSTq1N8Et+hVxzJx7KHhVIQ3yPH0ZzDPQYvWImyYSi
         Ak2w==
X-Gm-Message-State: AOJu0YzYy492KmjoxUmpT4+rYcMxySz3ARvNdruwrOxTDT6Vt/A2nBNA
	sYgb/ZTWv008Nfij4XfR60ZXULWzw/3RRq3DPf4uomKNYnr8eyV1kvicRLEdgXFlkHgc4FMZPJ1
	hIfeb0jT0u0PYyQAnlqqIMTfmCVeu2zS6zExqZY/BiSg7QiG1SPYVj51xLJBONMRLUW4eZZPQnW
	JLDg0rQhyd5hoP3XXLq7Ofpi/SQnSNndDFrG4HM36xEcqT
X-Gm-Gg: ASbGncs4+ujZ/BQSOZidgyvlhNsGd+oNkB2MBL5LaZN9rNCYpYM77FXycWi9/KX+rYY
	hzmKMszM6Xooe11ngkgvnygWLqFr4NKRWvO8T5mBn5wIUynpiaSNc5SARwvAs3crmXGa8J0cpRC
	24Pw0W1TQuJ1LYdJSTf1Yhbp5673MtYgXS2z0P1pffeDfJ6iLNo2JFsKNHzMrhO94DOcsuDvQqF
	kFjIl2N0xRlrW7aRDd7gkjWS1pIBTG8d++Mf9gOk4T70HpWZqMRoj794FyOHmPIIwKguQ==
X-Google-Smtp-Source: AGHT+IFPJPD3G+vsvta4mOgRpEA29NRLOxUO3j7lNjp4duGkW8/VFo1QLf0iHa5lO9d+7KuptZwP9v+8AS5kQtB7Oo8=
X-Received: by 2002:a05:622a:2597:b0:4f0:30af:7d41 with SMTP id
 d75a77b69052e-4f03fec389amr151124081cf.52.1765274184304; Tue, 09 Dec 2025
 01:56:24 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Dec 2025 03:56:23 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Dec 2025 03:56:23 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Dec 2025 03:51:37 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Dec 2025 03:21:03 -0800
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial3@fours-fze.com>
Reply-To: commercial3@fours-fze.com
In-Reply-To: <CAGzhOwNiaHR3nU=oFP5B0TyJrmSaVWHaJz7W1bthnU1AqFkSkQ@mail.gmail.com>
References: <CAGzhOwNiaHR3nU=oFP5B0TyJrmSaVWHaJz7W1bthnU1AqFkSkQ@mail.gmail.com>
Date: Tue, 9 Dec 2025 03:56:23 -0600
X-Gm-Features: AQt7F2oiaEFXO7pny6GZ3JfrnyaTt_3_dWPiQdIVmLcxmn3PIHQb6b523b5MmGc
Message-ID: <CAGzhOwNxEzi6pH31B09HhkO_3JCXcrF3pAs7_PO2sg0L_4N5DQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Voraussetzungen_f=C3=BCr_Reifen_und_Metallabf=C3=A4lle?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000afda95064581ec89"

--000000000000afda95064581ec89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,

wir hoffen, dass es Ihnen gut geht.

Bitte lassen Sie uns wissen, ob Sie Reifen oder Metallschrott zum Verkauf
haben.

On Saturday, December 6, 2025 at 3:16 AM, Commercial - Four Seasons FZE <
commercial3@fours-fze.com> wrote:

> Guten Tag,
>
> mein Name ist Anshul Goel von Four Seasons FZE, Vereinigte Arabische
> Emirate.
>
> Wir sind interessiert daran, Reifen und Metallschrott zu erwerben.
>
> *Reifenschrott*
> Ballen, 3 Schnitte, Schl=C3=A4uche, GT
>
>
> *Metallschrott*1) Motorschrott, Transformatoren, Autokompressoren,
> W=C3=A4rmetauscher, Stromz=C3=A4hler
> 2) Stahllegierungen, Bohrwerkzeuge, Roboterschrott
>
> Bitte lassen Sie uns wissen, ob Sie diese Materialien anbieten k=C3=B6nne=
n,
> inklusive:
> Fotos
> Mengenangaben
> Preise FOB/CNF auf Basis des indischen Hafens
> Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare Informationen
>
> Wir versichern Ihnen, dass wir =C3=BCber alle erforderlichen Lizenzen und
> Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCgen.
>
> [image: TYRE METAL REQ PIC.png]
> abmelden
> <https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1-01fe-4cb3-a091-560=
9c85382f3>
>

--=20
*Your Prompt response will be highly appreciated.*


--


*
*

--000000000000afda95064581ec89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,<br><br>wir hoffen, dass es Ihnen gut geht.<br><br>Bitte lassen Sie u=
ns wissen, ob Sie Reifen oder Metallschrott zum Verkauf haben.<div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Saturday, December 6, 2025 =
at 3:16 AM, Commercial - Four Seasons FZE &lt;<a href=3D"mailto:commercial3=
@fours-fze.com">commercial3@fours-fze.com</a>&gt; wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Guten Tag,<br><br>mein Name ist =
Anshul Goel von Four Seasons FZE, Vereinigte Arabische Emirate.<br><br>Wir =
sind interessiert daran, Reifen und Metallschrott zu erwerben.</div><div di=
r=3D"ltr"><br><b>Reifenschrott</b> <br>Ballen, 3 Schnitte, Schl=C3=A4uche, =
GT<br><br><b>Metallschrott<br></b>1) Motorschrott, Transformatoren, Autokom=
pressoren, W=C3=A4rmetauscher, Stromz=C3=A4hler<br>2) Stahllegierungen, Boh=
rwerkzeuge, Roboterschrott<br><br>Bitte lassen Sie uns wissen, ob Sie diese=
 Materialien anbieten k=C3=B6nnen, inklusive:<br>Fotos<br>Mengenangaben<br>=
Preise FOB/CNF auf Basis des indischen Hafens<br>Verladehafen und zus=C3=A4=
tzliche verf=C3=BCgbare Informationen<br><br>Wir versichern Ihnen, dass wir=
 =C3=BCber alle erforderlichen Lizenzen und Zertifikate f=C3=BCr den Import=
 von Reifen verf=C3=BCgen.</div><div dir=3D"ltr"><br></div><img src=3D"http=
s://gmagimg.s3.us-west-2.amazonaws.com/UI/2430919/TYRE%20METAL%20REQ%20PIC.=
png" alt=3D"TYRE METAL REQ PIC.png" width=3D"487" height=3D"274"><br><div d=
ir=3D"ltr"></div><div dir=3D"ltr"><a href=3D"https://fours-fze-com.pmailrou=
te.net/x/u?u=3Db06226c1-01fe-4cb3-a091-5609c85382f3">abmelden</a></div></di=
v></div></div>
</div>
</div><img src=3D"https://fours-fze-com.hmailroute.net/AlH_SJcbbUQ_26C7FjIZ=
GGAB_srt1_M0NasMfQRoI3Ho3jHL_rkHLg0tjxQcToqBBCPo-jBGv279vl_BBCAZ-6TFcCDqMB5=
K473sBlspSd4A8yShwYynrLu-c3mtGWn1vio-PEF0yOn-SUKgWCIiitDDWNc2IjgDZF30e6ibxL=
wajgm1U9R60G6" alt=3D""></blockquote></div><br></div><img src=3D"https://fo=
urs-fze-com.hmailroute.net/zJEzaFyapzs0WIRjkdjfFqXYZwmjQksvrmpdka86illum2jR=
sJuuT--6ev7zraY8BsjxotU-XLNQW_tQICUOXsd4vl830KUvq9EwXMCV-sg8sXKcp1_TgvYcsl1=
ilbPXxb5VQDWtAReis96UGS3K2WvCc1omUfSbUFKmDyc9eRIajgmeD9xzbof5M15Z-mtT3WTFJl=
" alt=3D"">

<br>
<div style=3D"font-family:Arial,Helvetica,sans-serif;font-size:small;color:=
rgb(34,34,34)"><b>Your Prompt response will be highly appreciated.</b></div=
><div style=3D"font-family:Arial,Helvetica,sans-serif;font-size:small;color=
:rgb(34,34,34)"><br></div><div style=3D"font-family:Arial,Helvetica,sans-se=
rif;font-size:small;color:rgb(34,34,34)">--</div><div style=3D"font-family:=
Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,34)"><img src=3D=
"https://www.foursfze.com/img/FSFSIGN.png"><br></div><div style=3D"font-fam=
ily:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,34)"><b styl=
e=3D"font-size:x-small"><br></b></div>
--000000000000afda95064581ec89--
