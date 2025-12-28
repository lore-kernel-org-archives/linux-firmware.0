Return-Path: <SRS0=I+Da=7C=fours-fze.com=commercial2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F763D3B7E5
	for <linux-firmware@archiver.kernel.org>; Sun, 28 Dec 2025 13:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D94EFC4CEFB; Sun, 28 Dec 2025 13:43:55 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C02BCC113D0
	for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 13:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C02BCC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fours-fze.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fours-fze.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64472121ad5so4996642d50.0
        for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fours-fze.com; s=google; t=1766929433; x=1767534233; darn=kernel.org;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWIdbz/bq65a7J62oMKXywFIudw8hcuM6O+r3FTxTag=;
        b=U2DNkR5GJGioxDGd7bP1OodzspDpwmSSTPfdHxJH+rjKHgptmm90ZRrmGQUGgOynId
         CQLb9j2bwt8Dl6hwRrLlRY8TdJEJFbImJyfN2UgszLp7xSKO9tj2PCsMMErnIUdsF/vr
         GOzSjEpIuzlzyNgPkZBE8z+my73kmnVZz9jlutQZiSqod0OwyfyYiHpKqzaWcfoq36/V
         DiUUxDpsBmdYX8N098v61gkO8j4vFkbH7Fb4DrF1vTrqoI4gKZfPBhDik2nicfH7nnw3
         PMyT5bD0qsDUcRm6kg3F5u1lkUx/mLN/b/6AQMtjzmHHgUFcSntjLbgmeE+XwHlwvR/a
         hbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929433; x=1767534233;
        h=to:subject:message-id:date:references:in-reply-to:reply-to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWIdbz/bq65a7J62oMKXywFIudw8hcuM6O+r3FTxTag=;
        b=onjehVy71qMu+WDC0eHRjjQf9VqMTWw1J51Cd6P5y8xgvaqgU6o86xeUeGsjuQDtp7
         +h5GAcu20JbdPIYm+Bmyqtp1lGj3tO1l6ZOn7mE6dm6UCYH/IqkvlO01sWlq/JV5Pi2m
         Hy6jgiElMnNIbHd6iCFSH3dqNTtS+rH788zl+qBW7cUiey9aHi8cF+RqEsBuTz9O+P9W
         zk/+aoDfH48EBeFsdYbSuhbKbR4ENuAAx92nqUve+c0geZCTb7jlbSHvEuYvWirjIveO
         14w/dCSDnnpHXquLjex1JTq4Xxjj5mBw/R3DO58Dqq3T9dZy9UY0CxxQze7X2MsPEpKO
         TdCg==
X-Gm-Message-State: AOJu0YxA9fMgTWXzLqN2lewzl5D49GGVVg5jpuJ3zq0AxAybRMp9JqhL
	qqRWzzaIVtQxCpgP/eykw5TGe1AhOAc0tyds9PUt5jGh32HeMpSb26fHsM2cXrfXX0oYB30Ea2H
	mYmdP9ALkLAwSIgYIW49zHRQUFi2hnRfSIT45K0cC7Xg2I8kvk05o0mMrl0jQyoYrjE3OOx9FFb
	LbJcYqqP9d2pKOq2lnAE8HGMB7nOpOjDEt3ATz+olW7w==
X-Gm-Gg: AY/fxX6OoFgI9ScWEusyXSkECU/txD14Nl+B01HLw/Y4gMdvnO+FxaEu/1egd9PY/+J
	rNY3fk5St4TIRQIFQ3+gFbL106eF7WFAi72h4V8BK12XLGXK023nazjXVbl2TsQuqeOzi/3eyiJ
	u0/0YRMp8zEvLLpN5kt+dB+qaBiZWmIFq2Y6QM+MoPy8SGbbSL4hf6ScrXPkQLZFS7TfCxlEHI9
	OtiWbqiI6kUIaFN+O4Y3LrJPg5uuISHTzMSm5+mG5i+hap1AE9tjwnSpK4tudzDZwNDog==
X-Google-Smtp-Source: AGHT+IEl+Gxk3DiNYMVqrA83v+fZ83FZHM5MuMAJt+jwMH+Zy2j1cbre+ye/UdQuayPRYbVROcpiuK/j5qFpdNzdDHo=
X-Received: by 2002:a05:690e:4190:b0:644:7a37:e8bf with SMTP id
 956f58d0204a3-6466a8a5cc8mr21174677d50.55.1766929433156; Sun, 28 Dec 2025
 05:43:53 -0800 (PST)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 08:43:51 -0500
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 08:43:51 -0500
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 08:34:22 -0500
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 02:42:26 -0500
MIME-Version: 1.0
From: Commercial - Four Seasons FZE <commercial2@fours-fze.com>
Reply-To: commercial2@fours-fze.com
In-Reply-To: <CALc6dXQKf74GxwG5nKWB0L9PPx-=hyr6WMfsqtFE6AA4C9ftRw@mail.gmail.com>
References: <CALc6dXQKf74GxwG5nKWB0L9PPx-=hyr6WMfsqtFE6AA4C9ftRw@mail.gmail.com>
Date: Sun, 28 Dec 2025 08:43:51 -0500
X-Gm-Features: AQt7F2rf_1Zf9Ufn-ITDb745kSuuqvlUpnhk3ADXWKG9nqXAN7x0I2-PeaFIHi4
Message-ID: <CALc6dXTKLvn80UvTOY13AOz6rn4b3=C9F5Xr-2KngvNwQxQy6g@mail.gmail.com>
Subject: Re: Metal Scrap Needed: FOUR SEASONS FZE Inquiry
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000034ec7a0647035115"

--00000000000034ec7a0647035115
Content-Type: text/plain; charset="UTF-8"

Hello,

I hope this message finds you well. We wanted to check in regarding our
last email about our requirement for scrap metal.

If you have had a moment to look over the details or if there's another
person we should reach out to for this topic, please let us know.

We appreciate your attention to this and look forward to your response.

On Thursday, December 25, 2025 at 8:26 AM, Commercial - Four Seasons FZE <
commercial2@fours-fze.com> wrote:

> Greetings,
>
> This is Anshul Goel representing Four Seasons FZE.
>
> We are looking to acquire the following materials:
> 1) Drill bit scrap
> 2) Tungsten scrap
> 3) HPGR roll scrap
> 4) Platinum scrap (Pt)
> 5) Palladium scrap (Pd)
> 6) Rhodium scrap (Rh)
>
> Could you please inform us if you are able to provide these items, along
> with:
> Images.
> Available quantity.
> Your best FOB pricing.
>
> [image: Metal Scrap.jpg]
>
> click here to unsubscribe
> <https://fours-fze-com.qmailroute.net/x/u?u=b1c1175f-e986-4234-87da-b6bba9b51985>
>

-- 
*Your Prompt response will be highly appreciated.*


--


*
*

--00000000000034ec7a0647035115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>I hope this message finds you well. We wanted to check in reg=
arding our last email about our requirement for scrap metal.<br><br>If you =
have had a moment to look over the details or if there&#39;s another person=
 we should reach out to for this topic, please let us know.<br><br>We appre=
ciate your attention to this and look forward to your response.<div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thursday, December 25, 2=
025 at 8:26 AM, Commercial - Four Seasons FZE &lt;<a href=3D"mailto:commerc=
ial2@fours-fze.com">commercial2@fours-fze.com</a>&gt; wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div><div>Greetings,<br><br>This is Anshul Goel repr=
esenting Four Seasons FZE.<br><br>We are looking to acquire the following m=
aterials:<br>1) Drill bit scrap<br>2) Tungsten scrap<br>3) HPGR roll scrap<=
br>4) Platinum scrap (Pt)</div><div>5) Palladium scrap (Pd)<br>6) Rhodium s=
crap (Rh)<br><br>Could you please inform us if you are able to provide thes=
e items, along with:<br>Images.<br>Available quantity.<br>Your best FOB pri=
cing.<br><br></div><div><img src=3D"https://gmagimg.s3.us-west-2.amazonaws.=
com/UI/2430920/Metal%20Scrap.jpg" alt=3D"Metal Scrap.jpg" width=3D"192" hei=
ght=3D"192" style=3D"margin-right:0px"><br></div><div><br></div><div><a hre=
f=3D"https://fours-fze-com.qmailroute.net/x/u?u=3Db1c1175f-e986-4234-87da-b=
6bba9b51985" target=3D"_blank">click here to unsubscribe</a></div></div></d=
iv>
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
MiwGZFaslIFkX02Gz0iAawh8SJqtg6esSDVras_xBK" alt=3D"">

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
--00000000000034ec7a0647035115--
