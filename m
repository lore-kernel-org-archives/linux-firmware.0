Return-Path: <SRS0=8dd+=6U=fours-fze.com=commercial3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24560CFD314
	for <linux-firmware@archiver.kernel.org>; Sun, 14 Dec 2025 10:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F11E8C19422; Sun, 14 Dec 2025 10:34:28 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1751C4CEF1
	for <linux-firmware@kernel.org>; Sun, 14 Dec 2025 10:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1751C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4eda6a8cc12so25621081cf.0
        for <linux-firmware@kernel.org>; Sun, 14 Dec 2025 02:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1765708466; x=1766313266; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zn6ZQKQdtMn9E7seRQtte4MH+cFMoA3m6D50cx6BUrA=;
        b=NqCZqZmGIcCXO+n2yM+hKF+XEDFP28PKUvagEB57dCUvto4sRBh8zT39/ubgc6l+9r
         icYXHwI9+eNb9QkW+ff7x5UHKIvjRkTCYs1+CnV1njZ1Ie6Q2qc1r+rdQNreWOc65ohk
         dkYt1IocFZ5euvxwtDDC+oD2dPkO8Y8+Wdaa26kpGBSJUa6Xz1M2zXqrkyGJSn3mC7pn
         TZhhWL4cLyPnwszfc5q1mV1I02LWIpRWBi5z7uGvxCbcfrCTeLWpbD6tqy9WLus0l2Mc
         mMCoprWW9eqV2yAuouTkyAUPRRvoJdBHp76WQWGlvzyghhvFnpnM4Vyk+6oYeLbbE03F
         /Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765708466; x=1766313266;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn6ZQKQdtMn9E7seRQtte4MH+cFMoA3m6D50cx6BUrA=;
        b=s/ClFc3nm954rG562N82FHlEpWLho2PPtUDiK6cPacUmSTqsJkizMWhjP9Ihpono3g
         LTFLgpHAY420hFFJp9vCMOEBz93OIJsG6gJseMP4B50D5M57/wb8vmdcNyv70wUxCCWS
         iGw9iu1eiZwQ9woclLEgFYWf8Lxbiqbppol5wTNm2dlsypc7XudZBuD3qQTvKY9eeOQC
         LIubMPm1rbBbIGhAI3h8pz0je1JRD2rwNTtg8u5OEwpwW99Si/+oi6ansKJZfS24BoTH
         D0nfDXcoa8PzThY0l7VHFM+HotC24vjpAxMuOU2QGB8ltMSMoNVoUicyH6At9iJzV5w3
         tLxQ==
X-Gm-Message-State: AOJu0Yzb54Xexj6zFGufQTG5h3xTxTXjLQJcVFxhlw1PocRaXbcxTGwH
	eLraKmo1b6BchTScU7x0S/4Fr++ARUBh6sc+W1CLuCmUEErD83Ytt1XoMQQFTGW4qDQ7xMsFrDe
	o1eLP09x6/LCduxEszhqhQTCKMKUWmtvDqr1E3h+iocferhu6c+2lmT64nmx+qfgoKs8LVZ1S2C
	oyYxOIdCIw0NUc1QEGOG7DM7mMpMnnaPn7ktF8Sg5hDY1N
X-Gm-Gg: AY/fxX4zL+uI56Vd5qcDm7WFMC9us5fVlaRb3s/DaIaU7jwRFFU2W2AMU0bf8NNfg+l
	zrJkKufeFa3o36dwHO2RVeDSSU5BXMtCmFZwia+aI2hNkDtjNSFqFk28MA+j5L0suJRXhkwAe97
	rCNm4OTQrmTaIsntZSwequ+PH9uRz03zxez1MHMItYi9AuMn8F4FEZjCG8+s3mYKS1DCrkqWxx7
	ORa4JcsJ/0MM76/ljrUiDhc4CqeegppShhPqXqCbdb84YFqcKn/3wUr16Er1VyomyVL8w==
X-Google-Smtp-Source: AGHT+IHa5PyTat9oNrkYXAO2SpyY6AuWKrlgEiBTQTqvMh2YoWjI522ruIfJwUGUWzwgVQZIoWDhuI0f6GvHDRdIlyU=
X-Received: by 2002:a05:622a:1902:b0:4ee:213b:3393 with SMTP id
 d75a77b69052e-4f1d04a7165mr112507111cf.4.1765708465861; Sun, 14 Dec 2025
 02:34:25 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 14 Dec 2025 04:34:25 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 14 Dec 2025 04:34:25 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 14 Dec 2025 04:32:27 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Dec 2025 03:21:03 -0800
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial3@fours-fze.com>
Reply-To: commercial3@fours-fze.com
In-Reply-To: <CAGzhOwM4OY0ET2p6ST2=s2B+9OZ9hM_tAOFNhoUPHwCDSVpbKw@mail.gmail.com>
References: <CAGzhOwNiaHR3nU=oFP5B0TyJrmSaVWHaJz7W1bthnU1AqFkSkQ@mail.gmail.com>
 <CAGzhOwNxEzi6pH31B09HhkO_3JCXcrF3pAs7_PO2sg0L_4N5DQ@mail.gmail.com> <CAGzhOwM4OY0ET2p6ST2=s2B+9OZ9hM_tAOFNhoUPHwCDSVpbKw@mail.gmail.com>
Date: Sun, 14 Dec 2025 04:34:25 -0600
X-Gm-Features: AQt7F2rjZl1kB4xurQDl4LvAbPH3SVBJT3fkT5U_7KnY5k5wFbEZg0ZlGDcyxq4
Message-ID: <CAGzhOwPsqNC=vdU5G5CpiHwwsqN5Ud5ufJUcG3sf8Pv31JX=Wg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Voraussetzungen_f=C3=BCr_Reifen_und_Metallabf=C3=A4lle?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000e283140645e70990"

--000000000000e283140645e70990
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,

ich hoffe, Ihnen geht es gut.
Wir haben schon eine Weile auf Ihre R=C3=BCckmeldung gewartet.

Vor einigen Tagen haben wir Ihnen eine E-Mail mit unseren Anforderungen
gesendet.
W=C3=A4ren Sie so freundlich, uns mitzuteilen, ob Sie aktuell dieses oder e=
in
alternatives Scarp-Modell zur Verf=C3=BCgung haben?

On Wednesday, December 10, 2025 at 4:56 AM, Commercial - Four Seasons FZE <
commercial3@fours-fze.com> wrote:

> Hallo,
>
> wir hoffen, dass Sie wohlauf sind.
>
> Wir m=C3=B6chten freundlich nachhaken, ob Sie Zeit gefunden haben, die E-=
Mail
> zu lesen, die wir Ihnen k=C3=BCrzlich zu unseren Anforderungen f=C3=BCr R=
eifen- und
> Metallschrott gesendet haben.
>
> On Tuesday, December 9, 2025 at 3:56 AM, Commercial - Four Seasons FZE <
> commercial3@fours-fze.com> wrote:
>
>> Hallo,
>>
>> wir hoffen, dass es Ihnen gut geht.
>>
>> Bitte lassen Sie uns wissen, ob Sie Reifen oder Metallschrott zum Verkau=
f
>> haben.
>>
>> On Saturday, December 6, 2025 at 3:16 AM, Commercial - Four Seasons FZE =
<
>> commercial3@fours-fze.com> wrote:
>>
>>> Guten Tag,
>>>
>>> mein Name ist Anshul Goel von Four Seasons FZE, Vereinigte Arabische
>>> Emirate.
>>>
>>> Wir sind interessiert daran, Reifen und Metallschrott zu erwerben.
>>>
>>> *Reifenschrott*
>>> Ballen, 3 Schnitte, Schl=C3=A4uche, GT
>>>
>>>
>>> *Metallschrott*1) Motorschrott, Transformatoren, Autokompressoren,
>>> W=C3=A4rmetauscher, Stromz=C3=A4hler
>>> 2) Stahllegierungen, Bohrwerkzeuge, Roboterschrott
>>>
>>> Bitte lassen Sie uns wissen, ob Sie diese Materialien anbieten k=C3=B6n=
nen,
>>> inklusive:
>>> Fotos
>>> Mengenangaben
>>> Preise FOB/CNF auf Basis des indischen Hafens
>>> Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare Informationen
>>>
>>> Wir versichern Ihnen, dass wir =C3=BCber alle erforderlichen Lizenzen u=
nd
>>> Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCgen.
>>>
>>> [image: TYRE METAL REQ PIC.png]
>>> abmelden
>>> <https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1-01fe-4cb3-a091-5=
609c85382f3>
>>>
>>
>>
>

--=20
*Your Prompt response will be highly appreciated.*


--


*
*

--000000000000e283140645e70990
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,<br><br>ich hoffe, Ihnen geht es gut.<br>Wir haben schon eine Weile a=
uf Ihre R=C3=BCckmeldung gewartet.<br><br>Vor einigen Tagen haben wir Ihnen=
 eine E-Mail mit unseren Anforderungen gesendet.<br>W=C3=A4ren Sie so freun=
dlich, uns mitzuteilen, ob Sie aktuell dieses oder ein alternatives Scarp-M=
odell zur Verf=C3=BCgung haben?<div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Wednesday, December 10, 2025 at 4:56 AM, Commercial - Four=
 Seasons FZE &lt;<a href=3D"mailto:commercial3@fours-fze.com">commercial3@f=
ours-fze.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hallo,<br><br=
>wir hoffen, dass Sie wohlauf sind.<br><br>Wir m=C3=B6chten freundlich nach=
haken, ob Sie Zeit gefunden haben, die E-Mail zu lesen, die wir Ihnen k=C3=
=BCrzlich zu unseren Anforderungen f=C3=BCr Reifen- und Metallschrott gesen=
det haben.<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tues=
day, December 9, 2025 at 3:56 AM, Commercial - Four Seasons FZE &lt;<a href=
=3D"mailto:commercial3@fours-fze.com">commercial3@fours-fze.com</a>&gt; wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hallo,<br><br>wir hoffen, dass es Ihn=
en gut geht.<br><br>Bitte lassen Sie uns wissen, ob Sie Reifen oder Metalls=
chrott zum Verkauf haben.<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Saturday, December 6, 2025 at 3:16 AM, Commercial - Four Seasons=
 FZE &lt;<a href=3D"mailto:commercial3@fours-fze.com">commercial3@fours-fze=
.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr">Guten Tag,<br><br>mein Name ist Anshul Goel von Four Seasons FZE, Ver=
einigte Arabische Emirate.<br><br>Wir sind interessiert daran, Reifen und M=
etallschrott zu erwerben.</div><div dir=3D"ltr"><br><b>Reifenschrott</b> <b=
r>Ballen, 3 Schnitte, Schl=C3=A4uche, GT<br><br><b>Metallschrott<br></b>1) =
Motorschrott, Transformatoren, Autokompressoren, W=C3=A4rmetauscher, Stromz=
=C3=A4hler<br>2) Stahllegierungen, Bohrwerkzeuge, Roboterschrott<br><br>Bit=
te lassen Sie uns wissen, ob Sie diese Materialien anbieten k=C3=B6nnen, in=
klusive:<br>Fotos<br>Mengenangaben<br>Preise FOB/CNF auf Basis des indische=
n Hafens<br>Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare Informationen=
<br><br>Wir versichern Ihnen, dass wir =C3=BCber alle erforderlichen Lizenz=
en und Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCgen.</div><div =
dir=3D"ltr"><br></div><img src=3D"https://gmagimg.s3.us-west-2.amazonaws.co=
m/UI/2430919/TYRE%20METAL%20REQ%20PIC.png" alt=3D"TYRE METAL REQ PIC.png" w=
idth=3D"487" height=3D"274"><br><div dir=3D"ltr"></div><div dir=3D"ltr"><a =
href=3D"https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1-01fe-4cb3-a09=
1-5609c85382f3">abmelden</a></div></div></div></div>
</div>
</div><img src=3D"https://fours-fze-com.hmailroute.net/AlH_SJcbbUQ_26C7FjIZ=
GGAB_srt1_M0NasMfQRoI3Ho3jHL_rkHLg0tjxQcToqBBCPo-jBGv279vl_BBCAZ-6TFcCDqMB5=
K473sBlspSd4A8yShwYynrLu-c3mtGWn1vio-PEF0yOn-SUKgWCIiitDDWNc2IjgDZF30e6ibxL=
wajgm1U9R60G6" alt=3D""></blockquote></div><br></div><img src=3D"https://fo=
urs-fze-com.hmailroute.net/zJEzaFyapzs0WIRjkdjfFqXYZwmjQksvrmpdka86illum2jR=
sJuuT--6ev7zraY8BsjxotU-XLNQW_tQICUOXsd4vl830KUvq9EwXMCV-sg8sXKcp1_TgvYcsl1=
ilbPXxb5VQDWtAReis96UGS3K2WvCc1omUfSbUFKmDyc9eRIajgmeD9xzbof5M15Z-mtT3WTFJl=
" alt=3D""></blockquote></div><br></div><img src=3D"https://fours-fze-com.h=
mailroute.net/kNUQhR_cKKa1ciearMX9vld3Ajr9XaYgiKq_fkhqLmjlEFAgsScUk-szE0utf=
ZUPoRoCE93YpY6k6uv8s7LJpStq_MErfzDgSBJPE0bKTgL4ceRVG6vLWD_p_RVws4sQdJJV4KY9=
rzbNUeYIcqZu7W7w96WpeXjkn-PuEner0bYajgmeZMnhEgDg_KWq0yBMkrBWwSo4tNwFGt-Q6ge=
WV2rZRWTQrMHltply7R" alt=3D""></blockquote></div><br></div><img src=3D"http=
s://fours-fze-com.hmailroute.net/oLvoxbcAAoZsuKf4vVJElfLyt41QIFomMaZkbXpqxf=
IH7Ewocs2c0zc09U7WozS6M4nbOvNt58dxc1DFlzDCOTkN6cbSGq4zarkl8NxT_WGW27ZNQ6E-d=
3OdQGc2Pi27kdU87TmhB15mMXHUJCRaTL2-8PsnTOZqWCdaRR3c6aMajgmSea-Q_eBb9xnqe8BY=
4o1R8S_n" alt=3D"">

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
--000000000000e283140645e70990--
