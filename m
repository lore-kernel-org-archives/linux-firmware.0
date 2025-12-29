Return-Path: <SRS0=vSft=7D=fours-fze.com=commercial2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DBFD3B7E5
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Dec 2025 13:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7510DC16AAE; Mon, 29 Dec 2025 13:43:52 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30964C4CEF7
	for <linux-firmware@kernel.org>; Mon, 29 Dec 2025 13:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30964C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fba1a1b1eso103918577b3.1
        for <linux-firmware@kernel.org>; Mon, 29 Dec 2025 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1767015829; x=1767620629; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IYoG61HOqHvjJC/9hH5z/YefWFCOkp6DTMpq03dfSPw=;
        b=CftkrVtwwlMtr9V2dFEZwwbUT2aV3Ljfw15qTMET9S53q+afn4QR9jZPAgdceIyOUB
         F5nQk/4Rs4yLDRrkQn67Tz6KELfKpADXlKBCUQ1DG61Nh43t4xF6jz16SqoLGAzPPgAY
         Pw1TMMhJVhAxELmtrpUJ1vQiMAOIIS0o21zAXPH+RadvL7SmBzSbdtzlFDLs/O0OOoGE
         fcFBTIfItOSr0cHSNgJbUKefu+mgtHkXP56cfKsVKWxQwSuyawy/sIQ0DpEvrjQ/5NdQ
         4h4bGNWFg3oIKKQstm28+TD8GXk1k0sqh2qTwAO+4XkMADr2W9y+IyA7YvxGD79bNybM
         DrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767015829; x=1767620629;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYoG61HOqHvjJC/9hH5z/YefWFCOkp6DTMpq03dfSPw=;
        b=xMFn33QNotRip1hlpQ+w6jeoBsdeOWZLjw1n+RAkM/s3YxxzG7f30+4XFlckbMWIbo
         VW2Noruwv8bNLbNp/TDFCHE+p2Y8mOMuEaS8GBqCMOdRN+zrJLyZ5578d421ngtAYeRo
         3c47IZKD/95pf1qY8+Qj8MTXzCxbIU/uEJ3ea4TAQBF5E6Lfh0hfNNwh1GKHXEVJnzb8
         2UqQ3jhe2NhkVZVPHk0C4lT8Ixr6XYLwysrfa3lznykIJnnRd5a54ZeVpalkYudIoiet
         sflTmjouBfS+UhGqQZnnDd3i2n5VC6ehyXp69sEd0iyJ1NxONKQRNkPxGwKRv6yKIG4z
         QFLg==
X-Gm-Message-State: AOJu0YzmEkr/SUMOeUYyBA0P+uY3TliKRGtiJOepPbLHkyaUsfu11rv+
	tZEsLf9lfxCQZBlpD4kMsDFdl2exasH+jIyXsjxJVQVnNP53MNNS+sFOovAxmOeFsTF+RgPlDM+
	sJ8913zOzTleEXz8fYlMAos+9ZTtogn0GhlMKWBBom/jWKeP7LwunWEpvgqPd+nL/sfg0s9IcDn
	kinStRR0a7zJFoCz4b9AER1HMR/QKJXFvjj/Ki+7n0Gg==
X-Gm-Gg: AY/fxX6C52YBb7RdZX2rMeSWFhhQwg+SAWKlm77vqcnGdy6egOzsp7Bs7ftmQ14QkmB
	R3QXGMsAMms3fTdEk8I7pDky7bYIGsB3Mqjp+rMAzm9tZa1pjqX3WwTlKV/bB6ZZh3F3zdJ20cO
	/w6MMnfnY7lGoznFxhsDtLT+QXckuSUtoqziaypWESyfgx+iKSZCpX9YH6C9Iz8kblWlLbicglK
	LTdnXzQ/cqEGL4EnpOSsIv26pfCUQ1ZX2eDSA8rMD/+bb+8/hUgd2ThOY7GAhSLNEqiDciK71w7
	vXrT
X-Google-Smtp-Source: AGHT+IFhAc+adHyHSlKAWYgGaW6IVRF4ap5RBxN+p1wHutiz5eR95iwSqYQoiFNdDGXuLH2DlqSQrAJPaHvcIc65+Mk=
X-Received: by 2002:a05:690e:134f:b0:646:5127:a024 with SMTP id
 956f58d0204a3-646632275b8mr27839483d50.7.1767015829563; Mon, 29 Dec 2025
 05:43:49 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Dec 2025 08:43:48 -0500
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Dec 2025 08:43:48 -0500
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Dec 2025 22:36:51 +0900
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 02:42:26 -0500
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial2@fours-fze.com>
Reply-To: commercial2@fours-fze.com
In-Reply-To: <CALc6dXTKLvn80UvTOY13AOz6rn4b3=C9F5Xr-2KngvNwQxQy6g@mail.gmail.com>
References: <CALc6dXQKf74GxwG5nKWB0L9PPx-=hyr6WMfsqtFE6AA4C9ftRw@mail.gmail.com>
 <CALc6dXTKLvn80UvTOY13AOz6rn4b3=C9F5Xr-2KngvNwQxQy6g@mail.gmail.com>
Date: Mon, 29 Dec 2025 08:43:48 -0500
X-Gm-Features: AQt7F2qH1ed638s_9pw3KKrVFsdrh1doAUy3o1u51t9K7tupTqZiBflFJ6CxFMU
Message-ID: <CALc6dXQpykatHWfyCUj=j88urzBE=JfDtVDobq7aaj1m5Le1CQ@mail.gmail.com>
Subject: Re: Metal Scrap Needed: FOUR SEASONS FZE Inquiry
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000d57bbf0647176ed1"

--000000000000d57bbf0647176ed1
Content-Type: text/plain; charset="UTF-8"

Hello,

We trust you are doing well.

We wanted to follow up and see if you had received our previous email.
Please inform us if you have any availability for drill scrap, HPGR roll
scrap, tungsten scrap, platinum scrap, palladium scrap, and rhodium scrap.

On Sunday, December 28, 2025 at 8:43 AM, Commercial - Four Seasons FZE <
commercial2@fours-fze.com> wrote:

> Hello,
>
> I hope this message finds you well. We wanted to check in regarding our
> last email about our requirement for scrap metal.
>
> If you have had a moment to look over the details or if there's another
> person we should reach out to for this topic, please let us know.
>
> We appreciate your attention to this and look forward to your response.
>
> On Thursday, December 25, 2025 at 8:26 AM, Commercial - Four Seasons FZE <
> commercial2@fours-fze.com> wrote:
>
>> Greetings,
>>
>> This is Anshul Goel representing Four Seasons FZE.
>>
>> We are looking to acquire the following materials:
>> 1) Drill bit scrap
>> 2) Tungsten scrap
>> 3) HPGR roll scrap
>> 4) Platinum scrap (Pt)
>> 5) Palladium scrap (Pd)
>> 6) Rhodium scrap (Rh)
>>
>> Could you please inform us if you are able to provide these items, along
>> with:
>> Images.
>> Available quantity.
>> Your best FOB pricing.
>>
>> [image: Metal Scrap.jpg]
>>
>> click here to unsubscribe
>> <https://fours-fze-com.qmailroute.net/x/u?u=b1c1175f-e986-4234-87da-b6bba9b51985>
>>
>
>

-- 
*Your Prompt response will be highly appreciated.*


--


*
*

--000000000000d57bbf0647176ed1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>We trust you are doing well.<br><br>We wanted to follow up an=
d see if you had received our previous email.<br>Please inform us if you ha=
ve any availability for drill scrap, HPGR roll scrap, tungsten scrap, plati=
num scrap, palladium scrap, and rhodium scrap.<div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sunday, December 28, 2025 at 8:43 AM, Comme=
rcial - Four Seasons FZE &lt;<a href=3D"mailto:commercial2@fours-fze.com">c=
ommercial2@fours-fze.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">H=
ello,<br><br>I hope this message finds you well. We wanted to check in rega=
rding our last email about our requirement for scrap metal.<br><br>If you h=
ave had a moment to look over the details or if there&#39;s another person =
we should reach out to for this topic, please let us know.<br><br>We apprec=
iate your attention to this and look forward to your response.<div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Thursday, December 25, 2025=
 at 8:26 AM, Commercial - Four Seasons FZE &lt;<a href=3D"mailto:commercial=
2@fours-fze.com">commercial2@fours-fze.com</a>&gt; wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div><div>Greetings,<br><br>This is Anshul Goel represe=
nting Four Seasons FZE.<br><br>We are looking to acquire the following mate=
rials:<br>1) Drill bit scrap<br>2) Tungsten scrap<br>3) HPGR roll scrap<br>=
4) Platinum scrap (Pt)</div><div>5) Palladium scrap (Pd)<br>6) Rhodium scra=
p (Rh)<br><br>Could you please inform us if you are able to provide these i=
tems, along with:<br>Images.<br>Available quantity.<br>Your best FOB pricin=
g.<br><br></div><div><img src=3D"https://gmagimg.s3.us-west-2.amazonaws.com=
/UI/2430920/Metal%20Scrap.jpg" alt=3D"Metal Scrap.jpg" width=3D"192" height=
=3D"192" style=3D"margin-right:0px"><br></div><div><br></div><div><a href=
=3D"https://fours-fze-com.qmailroute.net/x/u?u=3Db1c1175f-e986-4234-87da-b6=
bba9b51985" target=3D"_blank">click here to unsubscribe</a></div></div></di=
v>
</div>
</div>
</div>
</div>
</div>
</div>
</div><img src=3D"https://fours-fze-com.emailroute.net/AlH_SJcbbUQ_26C7FjIZ=
GOGOIzSQZ9Bm6q_sqacTAmu2RWKlFZn3_J0Qj8WZe8LFsKPurjVSjyseTuU27e8wGDrF0CjXgD_=
ZcKq6p0Zr2AFOTCVsu5jtSE7qvfwssHG54sJSpfZ4XwDIqnIWIX_Os0WpcidPV5H2fbAUBOYOcc=
IajgmI4BAP1Awiz4LOI2wemh" alt=3D""></div></blockquote></div><br></div><img =
src=3D"https://fours-fze-com.emailroute.net/ANahNsNPPvjniM5YYOGcgLVWtC-zziW=
kaG2XhA40mxgYnLmdKvvjxF5fPHYyGF-fdI3hu3XKaQwTGmT5OLDXL3qO-GtcRjjYQetGfmweuN=
mvTz9dAcjis8bqTOqnqR0mEZnkCLUK0FZtttx_noKlrewd9UhqKSDdwHaPPm0PCoEajgmJ3Bk4b=
MiwGZFaslIFkX02Gz0iAawh8SJqtg6esSDVras_xBK" alt=3D""></blockquote></div><br=
></div><img src=3D"https://fours-fze-com.emailroute.net/AlH_SJcbbUQ_26C7FjI=
ZGLWBZbfwdURdoP9BbTpboVbS4Eoipc15EdmthykUFGlCWMo7aykk24wqE7T5eIJEU3jMm2AO5o=
foJ-ucNctE2tMJmovKxnLvP4vYplRWnCmoBmzPeZqq3NBDb5jaPOBGwwQh_mQH90lpBjjsceoMO=
isajgmIv92" alt=3D"">

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
--000000000000d57bbf0647176ed1--
