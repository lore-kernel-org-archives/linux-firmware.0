Return-Path: <SRS0=Lsvb=6X=fours-fze.com=commercial3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83484D6409F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Dec 2025 09:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43F88C19422; Wed, 17 Dec 2025 09:31:06 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D852C4CEF5
	for <linux-firmware@kernel.org>; Wed, 17 Dec 2025 09:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D852C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2d6df99c5so40174185a.1
        for <linux-firmware@kernel.org>; Wed, 17 Dec 2025 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1765963861; x=1766568661; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A5klIyTdqh7jT20QmHuhLWsWZoqLcSnkRYacwxVGLbQ=;
        b=RGuyVEPgorY693SHxhp4VcBD6YUsJFYw48HC7vgnA3d5yuDrD1r4RH7MHKOCZtKowi
         BBn96XNbt3A1H7KqQFcTSBvfxBtmLhqiuQFEBNjhHELIv67iIfbFkEz0AQJd+uATMJmv
         Huc03bU52uWHEb+0/I9DGmcu3V0CVQSqaN1dBwdwj/BqEtwaDf/dAm1tLzzqtGie/w/f
         l+jKD/n6d7t3G6c1rPcg78R2Z0AyXHu4DAZ2DOmK7JO5IYCJRoEHaFQdhDIJHmxqIQ+K
         j792anC++8OyDeK6Btfi1ozB+np+yudkoldWB8WqVUcrE4G9GjrQFvkAas8wZY4a4ZDp
         iTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963861; x=1766568661;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5klIyTdqh7jT20QmHuhLWsWZoqLcSnkRYacwxVGLbQ=;
        b=wz53x4c+XWBE08u5CNXbpgT4ZLdNl7cJfM3xZf0hKcQIIoXs8u6KGaEuk6qWh55HKw
         7E+vjx5csRIWgAd3AkZ3FBecbb0StiP94BHT41oE4j9MnoG8qLMU0jAk5PCk3S3auA39
         WSjY82cf8YyfPJWGdq9K2ZCG7ueQzXsrw8lYxbf+2eyqyzfBUGknyGJm3Azv7gY/If6E
         yloqUFhHbeKiIzv2Qcm0nqc6ndxxnU9zpt3YWU2oHIZ8xcWJ3TeQjRPAxPuDgw8tWrIf
         TX91YVFyYf5wd8C1YiNWADfkx+s8ouANa2EBDv3fqSNdRiasaMYCphicOLb86pVTEPre
         nBFg==
X-Gm-Message-State: AOJu0YzqjKUaqBEGvbJPGMjK+NCMPBaei+UvDbDGIZ2qUvVOi83pRgJX
	NEKyiW8U6g7xt/xE8GVjAvkFr/t81EyvSBIydh06iJ7nIJaVTC9q2MQc52w7GhATSssPM4O4h9j
	4OGfDYSEq2I9L8fxv/vSNvlfc/tWRbUzDWQhnasAlahaDcQQksdmFwaQu9jxe7wlqoXU2hDXOQ8
	18/DgN2jQAlZlaA7ETj5KMX5pN5HmxoYVjh8xzXxjDhTl8pnc=
X-Gm-Gg: AY/fxX7Aq9LWR1GAmKkdEDLqtefmDGFq9ObM8Z25CNhHYS9LfzuSTqAnf+JBvjRgj1b
	0xFks5s+BselhJLK3lw49oBRb4kgAOlmh4ih916YKiMnxI7G/pWRKk5ZyCJ3vTK3xAFMP63jbD9
	ILnKqULEQCKwBZwwAVaDTMTl61HX9wxDgAZjpo4KQwGPW9UybvUTOEAb7h5idxuxn9rd7LTuMNv
	CcqWciIqx0I8w84bMW3bkqYjADf1qLUECo7T5TVwV7UBZ1phnLPWNHHJM/KRC6V5jH/YQ==
X-Google-Smtp-Source: AGHT+IHjrwxVNFl0ReLBkA64OAU9A4gvA+S9xqPZ0XpXIbSbwSQQ8FONnuRisJHGI3yHSyQxmLeyCv5xW9apbIq14NA=
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id
 d75a77b69052e-4f1da24ada5mr214613761cf.16.1765963861117; Wed, 17 Dec 2025
 01:31:01 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Dec 2025 01:31:00 -0800
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Dec 2025 01:31:00 -0800
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Dec 2025 01:28:39 -0800
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Dec 2025 03:21:03 -0800
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial3@fours-fze.com>
Reply-To: commercial3@fours-fze.com
In-Reply-To: <CAGzhOwPsqNC=vdU5G5CpiHwwsqN5Ud5ufJUcG3sf8Pv31JX=Wg@mail.gmail.com>
References: <CAGzhOwNiaHR3nU=oFP5B0TyJrmSaVWHaJz7W1bthnU1AqFkSkQ@mail.gmail.com>
 <CAGzhOwNxEzi6pH31B09HhkO_3JCXcrF3pAs7_PO2sg0L_4N5DQ@mail.gmail.com>
 <CAGzhOwM4OY0ET2p6ST2=s2B+9OZ9hM_tAOFNhoUPHwCDSVpbKw@mail.gmail.com> <CAGzhOwPsqNC=vdU5G5CpiHwwsqN5Ud5ufJUcG3sf8Pv31JX=Wg@mail.gmail.com>
Date: Wed, 17 Dec 2025 01:31:00 -0800
X-Gm-Features: AQt7F2o2Qv-RdUSXfKSM0V_dVL1kZu7hQqiBonvORg5GO9VKnab96tpRZrA_hFU
Message-ID: <CAGzhOwNARphf_HXpULX-0Dd5BM3U3m8kNvmdBfDs27eaJ6n3ZQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Voraussetzungen_f=C3=BCr_Reifen_und_Metallabf=C3=A4lle?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a0d92106462280f8"

--000000000000a0d92106462280f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,

wir hoffen, es geht Ihnen gut.

Wir m=C3=B6chten h=C3=B6flich nachhaken und wissen, ob Sie bereits Gelegenh=
eit
hatten, auf unsere Anfrage zu antworten. K=C3=B6nnen Sie uns die Reifen und
Metallabf=C3=A4lle, wie zuvor besprochen, anbieten oder uns an jemanden
verweisen, der dies tun kann?

On Sunday, December 14, 2025 at 4:34 AM, Commercial - Four Seasons FZE <
commercial3@fours-fze.com> wrote:

> Hallo,
>
> ich hoffe, Ihnen geht es gut.
> Wir haben schon eine Weile auf Ihre R=C3=BCckmeldung gewartet.
>
> Vor einigen Tagen haben wir Ihnen eine E-Mail mit unseren Anforderungen
> gesendet.
> W=C3=A4ren Sie so freundlich, uns mitzuteilen, ob Sie aktuell dieses oder=
 ein
> alternatives Scarp-Modell zur Verf=C3=BCgung haben?
>
> On Wednesday, December 10, 2025 at 4:56 AM, Commercial - Four Seasons FZE=
 <
> commercial3@fours-fze.com> wrote:
>
>> Hallo,
>>
>> wir hoffen, dass Sie wohlauf sind.
>>
>> Wir m=C3=B6chten freundlich nachhaken, ob Sie Zeit gefunden haben, die E=
-Mail
>> zu lesen, die wir Ihnen k=C3=BCrzlich zu unseren Anforderungen f=C3=BCr =
Reifen- und
>> Metallschrott gesendet haben.
>>
>> On Tuesday, December 9, 2025 at 3:56 AM, Commercial - Four Seasons FZE <
>> commercial3@fours-fze.com> wrote:
>>
>>> Hallo,
>>>
>>> wir hoffen, dass es Ihnen gut geht.
>>>
>>> Bitte lassen Sie uns wissen, ob Sie Reifen oder Metallschrott zum
>>> Verkauf haben.
>>>
>>> On Saturday, December 6, 2025 at 3:16 AM, Commercial - Four Seasons FZE=
 <
>>> commercial3@fours-fze.com> wrote:
>>>
>>>> Guten Tag,
>>>>
>>>> mein Name ist Anshul Goel von Four Seasons FZE, Vereinigte Arabische
>>>> Emirate.
>>>>
>>>> Wir sind interessiert daran, Reifen und Metallschrott zu erwerben.
>>>>
>>>> *Reifenschrott*
>>>> Ballen, 3 Schnitte, Schl=C3=A4uche, GT
>>>>
>>>>
>>>> *Metallschrott*1) Motorschrott, Transformatoren, Autokompressoren,
>>>> W=C3=A4rmetauscher, Stromz=C3=A4hler
>>>> 2) Stahllegierungen, Bohrwerkzeuge, Roboterschrott
>>>>
>>>> Bitte lassen Sie uns wissen, ob Sie diese Materialien anbieten k=C3=B6=
nnen,
>>>> inklusive:
>>>> Fotos
>>>> Mengenangaben
>>>> Preise FOB/CNF auf Basis des indischen Hafens
>>>> Verladehafen und zus=C3=A4tzliche verf=C3=BCgbare Informationen
>>>>
>>>> Wir versichern Ihnen, dass wir =C3=BCber alle erforderlichen Lizenzen =
und
>>>> Zertifikate f=C3=BCr den Import von Reifen verf=C3=BCgen.
>>>>
>>>> [image: TYRE METAL REQ PIC.png]
>>>> abmelden
>>>> <https://fours-fze-com.pmailroute.net/x/u?u=3Db06226c1-01fe-4cb3-a091-=
5609c85382f3>
>>>>
>>>
>>>
>>
>

--=20
*Your Prompt response will be highly appreciated.*


--


*
*

--000000000000a0d92106462280f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,<br><br>wir hoffen, es geht Ihnen gut.<br><br>Wir m=C3=B6chten h=C3=
=B6flich nachhaken und wissen, ob Sie bereits Gelegenheit hatten, auf unser=
e Anfrage zu antworten. K=C3=B6nnen Sie uns die Reifen und Metallabf=C3=A4l=
le, wie zuvor besprochen, anbieten oder uns an jemanden verweisen, der dies=
 tun kann?<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sund=
ay, December 14, 2025 at 4:34 AM, Commercial - Four Seasons FZE &lt;<a href=
=3D"mailto:commercial3@fours-fze.com">commercial3@fours-fze.com</a>&gt; wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hallo,<br><br>ich hoffe, Ihnen geht e=
s gut.<br>Wir haben schon eine Weile auf Ihre R=C3=BCckmeldung gewartet.<br=
><br>Vor einigen Tagen haben wir Ihnen eine E-Mail mit unseren Anforderunge=
n gesendet.<br>W=C3=A4ren Sie so freundlich, uns mitzuteilen, ob Sie aktuel=
l dieses oder ein alternatives Scarp-Modell zur Verf=C3=BCgung haben?<div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wednesday, December =
10, 2025 at 4:56 AM, Commercial - Four Seasons FZE &lt;<a href=3D"mailto:co=
mmercial3@fours-fze.com">commercial3@fours-fze.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Hallo,<br><br>wir hoffen, dass Sie wohlauf sind.<b=
r><br>Wir m=C3=B6chten freundlich nachhaken, ob Sie Zeit gefunden haben, di=
e E-Mail zu lesen, die wir Ihnen k=C3=BCrzlich zu unseren Anforderungen f=
=C3=BCr Reifen- und Metallschrott gesendet haben.<div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Tuesday, December 9, 2025 at 3:56 AM, Co=
mmercial - Four Seasons FZE &lt;<a href=3D"mailto:commercial3@fours-fze.com=
">commercial3@fours-fze.com</a>&gt; wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Hallo,<br><br>wir hoffen, dass es Ihnen gut geht.<br><br>Bitte lassen Sie=
 uns wissen, ob Sie Reifen oder Metallschrott zum Verkauf haben.<div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Saturday, December 6, 20=
25 at 3:16 AM, Commercial - Four Seasons FZE &lt;<a href=3D"mailto:commerci=
al3@fours-fze.com">commercial3@fours-fze.com</a>&gt; wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Guten Tag,<br><br>mein Name i=
st Anshul Goel von Four Seasons FZE, Vereinigte Arabische Emirate.<br><br>W=
ir sind interessiert daran, Reifen und Metallschrott zu erwerben.</div><div=
 dir=3D"ltr"><br><b>Reifenschrott</b> <br>Ballen, 3 Schnitte, Schl=C3=A4uch=
e, GT<br><br><b>Metallschrott<br></b>1) Motorschrott, Transformatoren, Auto=
kompressoren, W=C3=A4rmetauscher, Stromz=C3=A4hler<br>2) Stahllegierungen, =
Bohrwerkzeuge, Roboterschrott<br><br>Bitte lassen Sie uns wissen, ob Sie di=
ese Materialien anbieten k=C3=B6nnen, inklusive:<br>Fotos<br>Mengenangaben<=
br>Preise FOB/CNF auf Basis des indischen Hafens<br>Verladehafen und zus=C3=
=A4tzliche verf=C3=BCgbare Informationen<br><br>Wir versichern Ihnen, dass =
wir =C3=BCber alle erforderlichen Lizenzen und Zertifikate f=C3=BCr den Imp=
ort von Reifen verf=C3=BCgen.</div><div dir=3D"ltr"><br></div><img src=3D"h=
ttps://gmagimg.s3.us-west-2.amazonaws.com/UI/2430919/TYRE%20METAL%20REQ%20P=
IC.png" alt=3D"TYRE METAL REQ PIC.png" width=3D"487" height=3D"274"><br><di=
v dir=3D"ltr"></div><div dir=3D"ltr"><a href=3D"https://fours-fze-com.pmail=
route.net/x/u?u=3Db06226c1-01fe-4cb3-a091-5609c85382f3">abmelden</a></div><=
/div></div></div>
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
4o1R8S_n" alt=3D""></blockquote></div><br></div><img src=3D"https://fours-f=
ze-com.hmailroute.net/8qgP5gV7y27zzReOgfR4JWyLfJ8LwRBc_fsIeLUC1avdK56ZWCo-A=
Up7qNvVOPPvMRfPXTEtMiGiAM5dEc6wj13bgg7FaxtdKy0S4cH_GfTcCPoyG76n5ac_t1CNrQhb=
AYJ0HYCSllyX3EIgc4mVeu2N4NQeHCDnL-p2rEam9DIajgmM2_F1u46xscSSlteqU_vxxgng_dV=
8Hb3N_FO-lQArCTyxa1uMCQhIkqWKKK0Y_Z" alt=3D"">

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
--000000000000a0d92106462280f8--
