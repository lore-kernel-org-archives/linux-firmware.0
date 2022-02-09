Return-Path: <SRS0=JDmF=SY=biotechprospects.com=rosalyn.hollar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BAFC433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Feb 2022 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C55AC340ED; Wed,  9 Feb 2022 14:21:41 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 819ACC340E7
	for <linux-firmware@kernel.org>; Wed,  9 Feb 2022 14:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 819ACC340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=biotechprospects.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=biotechprospects.com
Received: by mail-ua1-f67.google.com with SMTP id w18so1365080uar.8
        for <linux-firmware@kernel.org>; Wed, 09 Feb 2022 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=biotechprospects.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=nRmf43tB9qJwWuU6a+WY2Bi4ra7QGMtM+k2iMpnGWX8=;
        b=fvZCDbSc40f+ubqMpC4NyX/MfLi/8Q2VzIjsc02C+oQsFEgZZgtSYEr33RDRVUi7oY
         KjcmZPvxdlc5rQU/Hun8Papo9wW/X293okyuZgvo4NLY15C1i3DgfH0B9J1ZXw4wevw/
         U/+RfB4mVE1CuGDr+tQKylcQFDGGMCuvX7C/6lcI4b/pC2mxunjkwek4Q0Cb41u5VUYa
         Ci1NeTTpP4QMQDSS5nvSa6QxLLpKLIL4IG3pURT5Uw36fnjxn2iB6VpRSlXWDJQRakL+
         PQgYprxfagoIbsrOVdI9+QO0GOsYM0RKtv9fFAq6RiUaGq+se5+5Qbgqzu6Nrz6dm4l0
         3D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nRmf43tB9qJwWuU6a+WY2Bi4ra7QGMtM+k2iMpnGWX8=;
        b=IZvaQJDCtFkQvbSFSQ2T+TCTZcJT93yremf7CXe7PUOuEkhSgwDL9Rj3m5O9ZqKuFx
         IRbt8yCPBUk7iufEdrFnPbqcOSm1Cwb7HdAdb2RPzzMIqSVQyDwOZAa+5wagB825Ht0p
         FXD1iMVHoGdeiIsKKRp4gAfL11obSn8/0ajioIUfzSh0hjedQKF7tCU8r8nFDSC3+XCM
         bksY+jgXuF9gjH+bemVzJKIBBTjBfPZnVEpuyjc22resBOMPDm5Be9lfz5cRFN+IwuuC
         x2t2I/xDF1/VKotGE7FEkB60JmGYFu4KIbjEswufofTp8VA9ufhVxfJ0LpfyRU73ZXvm
         zcYA==
X-Gm-Message-State: AOAM533iHI1wbNHIrjglNXBhLzwNxv4pUwFLZgI17M2oQS2A8ujQSKcP
	vK5yei2hLMZPLB/db33ABsFhYMHlmVVke/f+dicwVLo9k0c=
X-Google-Smtp-Source: ABdhPJxiOVHZc2qE0YZqlwMr98lg7/srXX1L72xdxSt8YXosE0M4wfzFsGhlsDRRlFQjWpw/imb4YwUutuc0QZlGKa4=
X-Received: by 2002:ab0:3c86:: with SMTP id a6mr979689uax.6.1644416499227;
 Wed, 09 Feb 2022 06:21:39 -0800 (PST)
Received: from 485962330057 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 06:21:38 -0800
MIME-Version: 1.0
from: rosalyn.hollar@biotechprospects.com
Date: Wed, 9 Feb 2022 06:21:38 -0800
Message-ID: <CAFLu6tAYBfAnX9Bm_WmtptTP6NERBuWeDQxf_rN8Bsz7yETEhg@mail.gmail.com>
Subject: AEEDC Dubai 2022 Professionals
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000004cafce05d7968d13"

--0000000000004cafce05d7968d13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Hope you are doing well.

I see that your company is a part of (AEEDC Dubai 2022) Exhibitors!

So I=E2=80=99m wondering if you are interested in acquiring an Attendees li=
st for
your pre and post-event campaigns.

We provide all the relevant information about the attendee including
Company Name, Company URL, Contact Name, Title, Phone number, Fax Number,
Email Address, Company Address, and Industry type. Hence you can use this
information for your email, telephonic, and mailing campaigns.

If you are interested, drop me a line. We will get back to you with
pricing, counts, and other information for your review.

If you think I should be talking to someone else, please forward this email
to the concerned person.

Looking forward to hearing from you.


Rosalyn Hollar

Data Analyst

www.leadgarner.com

4512 Legacy Dr STE 100
Plano, TX 75024
United States

Note: If you do not wish to receive future emails from us, please reply as
'No Requirements'.

--0000000000004cafce05d7968d13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello,</p>

<p>Hope you are doing well.</p>

<p>I see that your company is a part of (AEEDC Dubai 2022) Exhibitors!</p>

<p>So I=E2=80=99m wondering if you are interested in acquiring an Attendees=
 list for your pre and post-event campaigns.</p>

<p>We provide all the relevant information about the attendee including Com=
pany Name, Company URL, Contact Name, Title, Phone number, Fax Number, Emai=
l Address, Company Address, and Industry type. Hence you can use this infor=
mation for your email, telephonic, and mailing campaigns.</p>

<p>If you are interested, drop me a line. We will get back to you with pric=
ing, counts, and other information for your review.</p>

<p>If you think I should be talking to someone else, please forward this em=
ail to the concerned person.</p>

<p>Looking forward to hearing from you.</p>
<br>
<br>
<table style=3D"max-width:600px">
  <tbody>
    <tr>
      <td><img src=3D"https://www.leadgarner.com/static/assets/img/favicon.=
png" style=3D"max-width:100px">
      </td>
      <td><div style=3D"width:1em;height:100px;border-right:2px solid #3399=
ee;margin-right:1em"></div></td>
      <td>
        <p style=3D"font-family:Helvetica,sans-serif;font-size:22px;font-we=
ight:bold;color:#333333;margin:0">Rosalyn Hollar</p><p style=3D"font-family=
:Helvetica,sans-serif;font-size:18px;color:#666666;margin:0">Data Analyst</=
p><p style=3D"font-family:Helvetica,sans-serif;font-size:18px;color:#666666=
;margin:0"><a style=3D"color:#3399ee" href=3D"www.leadgarner.com">www.leadg=
arner.com</a></p><p style=3D"font-family:Helvetica,sans-serif;font-size:10p=
x;color:#666666;margin:0">4512 Legacy Dr STE 100 <br> Plano, TX 75024 <br> =
United States</p></td></tr></tbody></table><p style=3D"font-family:Helvetic=
a,sans-serif;font-size:18px;color:#666666;margin:0">Note: If you do not wis=
h to receive future emails from us, please reply as &#39;No Requirements&#3=
9;.</p>

--0000000000004cafce05d7968d13--
