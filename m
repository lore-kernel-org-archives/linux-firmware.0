Return-Path: <SRS0=edyy=6Q=fours-fze.com=commercial3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADD7D3B9A9
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Dec 2025 10:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA88AC113D0; Wed, 10 Dec 2025 10:56:54 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B877C4CEF1
	for <linux-firmware@kernel.org>; Wed, 10 Dec 2025 10:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B877C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee2293e6a2so51918011cf.0
        for <linux-firmware@kernel.org>; Wed, 10 Dec 2025 02:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1765364212; x=1765969012; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KM3xojx03y6e40QZCH/ziTvUinNLGBRRZQcfm+4oaYE=;
        b=o/pumDouLYELa96oznDOHrjvWjg8XwfwCTKgG4Y72uxMIXUlbsN2daVAM1d9f9TJjQ
         Kx7K+7fh3Th8beGHf/z5gRMxcIzghpP0lJDQ220HgKqgWGOny99SmYR1WUPNrILMtNbk
         ihaCVV3KSQX0ILHyDR10GVIYx0YghHjNMwR584NkQ3nPV1WBJTbf1Nsw2IEbC9RfJ5l4
         wY5EgpcBl+cauCj1yj9AclML9sE0Gy0CzZ1eXBnRc+HC9mSCnqxYHzMMUTUOiAaiFdsn
         1kMfmUrjatMy9xjHHodEinuaZnyIUVUJGDVI63qsxRWxB/lLHkiwbCZKb/oUCTcbS5dn
         B52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364212; x=1765969012;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM3xojx03y6e40QZCH/ziTvUinNLGBRRZQcfm+4oaYE=;
        b=EJ7GYQBYU/B190skAm0T4cLS8ZBphRHbnYfJvutYtz92CSp/0bGx3h4oDBG269P+nf
         GwFFeYYL5CE/J2bYH94ah/kwyffvxDC1LuxiSYrKzOaI2mN2KCvOY/dxrFfURefytoW/
         miwbguGgreYbWz173Sfw7N2IhTf0Kg0JELLapDpWd3fZgDC9O6aiVENqHuibNqrJUml+
         9lPM2gRZnFWzb0OUw8I1iRIbceVloPnSrJK5J9paM5d4BykCHfOHiynOmLOl18IhJhm5
         Y2bX7BWKmYJXQSzOodYyWljWrYgfTPf5UMAtnQpe+PkIrVQwVATGslGwKXYRLx2qnVlz
         xnrQ==
X-Gm-Message-State: AOJu0YzI3xPNXUSZnU2EP7JzrUzoEYnl5HhKP15+iFREiRSGxA8Q32+P
	FUzMpdjnUWh6hpxtV7K2Mobj2Ij0CGkwOK8cFgxiQU/52codMmhTCaj17VNPk1WFLUA9+6v0JcP
	sZRxzQT8oZP5VRsyoRQsgjsJT1qKGKEF21RXknO+VR/sqzhpizaCnvHjhKudVutSmdgnJ2YT6OO
	wj5FVw+fvAH/sGdP3OHgdnhFJQzLqHDQjtIDlXkOgaeeYX
X-Gm-Gg: ASbGncuWjkftfSVayhq8crObeTQVzNEcLzyH5m0lhNpPJFP9D5ckdR39oQCHXu5bTv5
	y/A7qYnNmXtp3SXOoHqQFcJO8+LtY5xPEGWH/dxDHP8+alcZKza3Ya4l4GpBCcIbwsbho4KyJsc
	ExYSh1gpfe1UAxwEERNbQ1n+BgHumWSI9W58L3dTAI4+rLoUcNt9L8qEBjvRf/870OvH+Pe3XX6
	fUL3lC4Y5RY3OAOYxz0jOPfVLyaM2y15YuU9EB4/BDJUN81s/M74yJcM4Hd9P2dvBXZxtDN8jWi
	BjrI
X-Google-Smtp-Source: AGHT+IFf1OTjJY3WYxqBCp3shszS+5Ds7kwxPl+NqmTBMe8KeRlS2YupEDc2ocsXHM5ee7YesqBvXqulixtRY8GRF6U=
X-Received: by 2002:a05:622a:4c06:b0:4e8:9e4e:5e3c with SMTP id
 d75a77b69052e-4f1b1ae89c8mr23240471cf.83.1765364212150; Wed, 10 Dec 2025
 02:56:52 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Dec 2025 04:56:51 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Dec 2025 04:56:51 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Dec 2025 04:53:10 -0600
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Dec 2025 03:21:03 -0800
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial3@fours-fze.com>
Reply-To: commercial3@fours-fze.com
In-Reply-To: <CAGzhOwNxEzi6pH31B09HhkO_3JCXcrF3pAs7_PO2sg0L_4N5DQ@mail.gmail.com>
References: <CAGzhOwNiaHR3nU=oFP5B0TyJrmSaVWHaJz7W1bthnU1AqFkSkQ@mail.gmail.com>
 <CAGzhOwNxEzi6pH31B09HhkO_3JCXcrF3pAs7_PO2sg0L_4N5DQ@mail.gmail.com>
Date: Wed, 10 Dec 2025 04:56:51 -0600
X-Gm-Features: AQt7F2ph144j3HjI6vJFSp2XVz8HVatW_m63mERui8SW3ufXfThwOBYOWUcsPcU
Message-ID: <CAGzhOwM4OY0ET2p6ST2=s2B+9OZ9hM_tAOFNhoUPHwCDSVpbKw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Voraussetzungen_f=C3=BCr_Reifen_und_Metallabf=C3=A4lle?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000c3c78b064596e25d"

--000000000000c3c78b064596e25d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,

wir hoffen, dass Sie wohlauf sind.

Wir m=C3=B6chten freundlich nachhaken, ob Sie Zeit gefunden haben, die E-Ma=
il zu
lesen, die wir Ihnen k=C3=BCrzlich zu unseren Anforderungen f=C3=BCr Reifen=
- und
Metallschrott gesendet haben.

On Tuesday, December 9, 2025 at 3:56 AM, Commercial - Four Seasons FZE <
commercial3@fours-fze.com> wrote:

> Hallo,
>
> wir hoffen, dass es Ihnen gut geht.
>
> Bitte lassen Sie uns wissen, ob Sie Reifen oder Metallschrott zum Verkauf
> haben.
>
> On Saturday, December 6, 2025 at 3:16 AM, Commercial - Four Seasons FZE <
> commercial3@fours-fze.com> wrote:
>
>> Guten Tag,
>>
>> mein Name ist Anshul Goel von Four Seasons FZE, Vereinigte Arabische
>> Emirate.
>>
>> Wir sind interessiert daran, Reifen und Metallschrott zu erwerben.
>>
>> *Reifenschrott*
>> Ballen, 3 Schnitte, Schl=C3=A4uche, GT
>>
>>
>> *Metallschrott*1) Motorschrott, Transformatoren, Autokompressoren,
>> W=C3=A4rmetauscher, Stromz=C3=A4hler
>> 2) Stahllegierungen, Bohrwerkzeuge, Roboterschrott
>>
>> Bitte lassen Sie uns wissen, ob Sie diese Materialien anbieten k=C3=B6nn=
en,
>> inklusive:
>> Fotos
>> Mengenangaben
>> Preise FOB/CNF auf Basis des indischen Hafens
>> Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare Informationen
>>
>> Wir versichern Ihnen, dass wir =C3=BCber alle erforderlichen Lizenzen un=
d
>> Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCgen.
>>
>> [image: TYRE METAL REQ PIC.png]
>> abmelden
>> <https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1-01fe-4cb3-a091-56=
09c85382f3>
>>
>
>

--=20
*Your Prompt response will be highly appreciated.*


--


*
*

--000000000000c3c78b064596e25d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,<br><br>wir hoffen, dass Sie wohlauf sind.<br><br>Wir m=C3=B6chten fr=
eundlich nachhaken, ob Sie Zeit gefunden haben, die E-Mail zu lesen, die wi=
r Ihnen k=C3=BCrzlich zu unseren Anforderungen f=C3=BCr Reifen- und Metalls=
chrott gesendet haben.<div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Tuesday, December 9, 2025 at 3:56 AM, Commercial - Four Seasons FZE=
 &lt;<a href=3D"mailto:commercial3@fours-fze.com">commercial3@fours-fze.com=
</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hallo,<br><br>wir hoffen,=
 dass es Ihnen gut geht.<br><br>Bitte lassen Sie uns wissen, ob Sie Reifen =
oder Metallschrott zum Verkauf haben.<div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Saturday, December 6, 2025 at 3:16 AM, Commercial - =
Four Seasons FZE &lt;<a href=3D"mailto:commercial3@fours-fze.com">commercia=
l3@fours-fze.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr">Guten Tag,<br><br>mein Name ist Anshul Goel von Four Sea=
sons FZE, Vereinigte Arabische Emirate.<br><br>Wir sind interessiert daran,=
 Reifen und Metallschrott zu erwerben.</div><div dir=3D"ltr"><br><b>Reifens=
chrott</b> <br>Ballen, 3 Schnitte, Schl=C3=A4uche, GT<br><br><b>Metallschro=
tt<br></b>1) Motorschrott, Transformatoren, Autokompressoren, W=C3=A4rmetau=
scher, Stromz=C3=A4hler<br>2) Stahllegierungen, Bohrwerkzeuge, Roboterschro=
tt<br><br>Bitte lassen Sie uns wissen, ob Sie diese Materialien anbieten k=
=C3=B6nnen, inklusive:<br>Fotos<br>Mengenangaben<br>Preise FOB/CNF auf Basi=
s des indischen Hafens<br>Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare=
 Informationen<br><br>Wir versichern Ihnen, dass wir =C3=BCber alle erforde=
rlichen Lizenzen und Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCg=
en.</div><div dir=3D"ltr"><br></div><img src=3D"https://gmagimg.s3.us-west-=
2.amazonaws.com/UI/2430919/TYRE%20METAL%20REQ%20PIC.png" alt=3D"TYRE METAL =
REQ PIC.png" width=3D"487" height=3D"274"><br><div dir=3D"ltr"></div><div d=
ir=3D"ltr"><a href=3D"https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1=
-01fe-4cb3-a091-5609c85382f3">abmelden</a></div></div></div></div>
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
WV2rZRWTQrMHltply7R" alt=3D"">

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
--000000000000c3c78b064596e25d--
