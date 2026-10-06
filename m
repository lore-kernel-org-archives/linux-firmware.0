Return-Path: <SRS0=NxVT=H4=dactuus.com=admin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FCACA5FF0
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Oct 2026 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CA061F00893; Tue,  6 Oct 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.249.115.216
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791295220;
	b=gu8Pv1uZEE446h9fhgmQtsk78mbc8KP9eSi6o0vnyNh8+IYxM6m+hx7yfyw4xQmp9Qt3
	 bcxVAg8a19MQPPBwAQmBJGsU/QBg0weD41bH+v0H95h5+ltt5G9xSOlmafhaiY7i+vAVq
	 G7Xokrv+3T9skFSRT1m5gbr1FxYCqI0b9/wAwaTzPe4r7ahHsrWYMMlVErJEt4mXp67HL
	 BK9aCPwZA/Ldx8h3h96S+eXKDhHa46fzefZ2ELvye5L6dPFjhS2NCIcT2bTKrZXCaTucc
	 fvRemoe7BjpOwWXp5XgnzeRZDTsAuM0EITIG6ejXkD9yp3D15zqsb94jbK/s8dMXfCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791295220;
	h=DMARC-Filter:Received:From:Subject:List-Id:To:Content-Type:
	 MIME-Version:Reply-To:Date:Message-Id;
	bh=EbcXDIOlcwKIw6U6GPzfE3gzgeyklSJ6S3sNPREwgm0=;
	b=Dgye9x5d0S0CaKRN07x146FQYVtSMl8x/EPbn859GfQs6+lyXPsX1BunIgRBad3xceYX
	 6JbdTX180qNrVJbVSV9LvQxq3jIH9Kc1uHoh5LBcd82swne96ULb7496ElFKAxNzwo5y4
	 qB/WcZUbN5RPAtn9QL0Dxeu5QZ9DhEKEEAKUDAIVCyIPIURSbYydJ8AxoqF1xFfprnpID
	 +LHIvpDCGRiTmErdZbG+vXttAXQSocbXDlcnxyi8I0c8vNMvT0n56m31LV6MYkqWEsQo1
	 +wtYsUOm2SPEKz1Sn4Y4TlqwcmOFuSAq0RjyozgBGB6nbQus131A+vwM8kDMDTIFpMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=dactuus.com;
	spf=pass smtp.mailfrom=dactuus.com;
	arc=none smtp.remote-ip=192.249.115.216
Received: from mail.dactuus.com (vps142687.inmotionhosting.com [192.249.115.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3A4B1F000FF
	for <linux-firmware@kernel.org>; Tue,  6 Oct 2026 14:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B3A4B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dactuus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dactuus.com
Received: from WIN-9QL4SDRB93L (unknown [194.59.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dactuus.com (Postfix) with ESMTPSA id 339B91A0660
	for <linux-firmware@kernel.org>; Tue,  6 Oct 2026 07:00:13 -0700 (PDT)
From: "Stefan Mayer" <admin@dactuus.com>
Subject: Urgent Supply Inquiry
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="TtIq=_OvM3pgIdoj6ltQWislglOyVBWVD4"
MIME-Version: 1.0
Reply-To: <stefanmayer@hpscorp.org>
Date: Tue, 6 Oct 2026 07:00:13 -0700
Message-Id: <061220261000077A7ED9A28F$6A255F51CD@dactuus.com>

This is a multi-part message in MIME format

--TtIq=_OvM3pgIdoj6ltQWislglOyVBWVD4
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello.

Greetings,

I hope this message finds you well.

We are reaching out on behalf of HPS Sourcing & Trading GmbH, an Austr=
ian-based international trading and sourcing company located at Karl-S=
chachinger-Strasse 2, 4070 Eferding, Austria. Our firm specializes in =
global sourcing, export and import of raw materials, technical product=
s, foodstuff, healthcare items, leisure and travel products, LED light=
ing, and wooden pellets for large-scale industrial and commercial proj=
ects.

As part of our current expansion and collaboration initiatives, we are=
 actively identifying reliable and reputable global partners - manufac=
turers, distributors, exporters, and importers - who can supply or col=
laborate with us in the above product categories.

Our goal is to establish long-term business relationships with compani=
es that share our commitment to quality, efficiency, and professional =
integrity.

If your company is interested in cooperation or supplying any of these=
 products, we kindly invite you to reply with your company profile, pr=
oduct catalogue, and trade terms. Upon receiving your confirmation, ou=
r procurement team will provide additional details on potential collab=
oration opportunities, including project specifications and partnershi=
p terms.

We look forward to the possibility of working together and building a =
successful, mutually beneficial relationship.

Thank you for your time and consideration.

Warm regards,
Stefan Mayer
Procurement Manager
HPS Sourcing & Trading GmbH
Karl-Schachinger-Strasse 2
4070 Eferding, Austria
?? +43 7272 6159
??=20

www.hps.cc http://www.hps.cc

--TtIq=_OvM3pgIdoj6ltQWislglOyVBWVD4
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-=
8859-1">
  <META name=3D"viewport" content=3D"width=3Ddevice-width, initial-sca=
le=3D1"> <META name=3D"format-detection" content=3D"telephone=3Dno"> <=
title>Urgent Supply Inquiry</title>
 </head>
 <body style=3D"BACKGROUND-COLOR: #ffffff" bgColor=3D#ffffff> <P>Hello=
=2E</p><p>Greetings,</p><p>I hope this message finds you well.</p><p>W=
e are reaching out on behalf of HPS Sourcing &amp; Trading GmbH, an Au=
strian-based international trading and sourcing company located at Kar=
l-Schachinger-Strasse 2, 4070 Eferding, Austria. Our firm specializes =
in global sourcing, export and import of raw materials, technical prod=
ucts, foodstuff, healthcare items, leisure and travel products, LED li=
ghting, and wooden pellets for large-scale industrial and commercial p=
rojects.</p><p>As part of our current expansion and collaboration init=
iatives, we are actively identifying reliable and reputable global par=
tners - manufacturers, distributors, exporters, and importers - who ca=
n supply or collaborate with us in the above product categories.</p><p=
>Our goal is to establish long-term business relationships with compan=
ies that share our commitment to quality, efficiency, and professional=
 integrity.</p><p>If your company is interested in cooperation or supp=
lying any of these products, we kindly invite you to reply with your c=
ompany profile, product catalogue, and trade terms. Upon receiving you=
r confirmation, our procurement team will provide additional details o=
n potential collaboration opportunities, including project specificati=
ons and partnership terms.</p><p>We look forward to the possibility of=
 working together and building a successful, mutually beneficial relat=
ionship.</p><p>Thank you for your time and consideration.</p><p>Warm r=
egards,<BR>Stefan Mayer<BR>Procurement Manager<BR>HPS Sourcing &amp; T=
rading GmbH<BR>Karl-Schachinger-Strasse 2<BR>4070 Eferding, Austria<BR=
>&#55357;&#56542; +43 7272 6159<BR>&#55356;&#57104; <A href=3D"http://=
www.hps.cc">www.hps.cc</A></P></body>
 </html>

--TtIq=_OvM3pgIdoj6ltQWislglOyVBWVD4--

