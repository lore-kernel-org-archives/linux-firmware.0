Return-Path: <SRS0=MS+V=HX=dactuus.com=admin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533CDCA5FCB
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Oct 2026 13:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27F5A1F00898; Thu,  1 Oct 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.249.115.216
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790859997;
	b=rqLiDFC9Dz6yOpCYooP9WnEaxS7uZubCHG9bwJhCBwkLk2Mp8hBdfg1m5mgfsJgOtYEp
	 8Kfc7lLG2kNjAk9XWRA3ceo5K5PDX7kROu3o5zC34uyIVU5lTruZYTKv+/6ZooDl2OzmJ
	 aK4BoqaxMHSRf39S+3uOKPnUw6ovHKZwl1JK8Zse7Q3cLntW6XmZ5TFPlH0joWcX220fL
	 OYcUs0kfgGrE0QpNCnaoQWB6ciG6tlOuMexL0nDymDe19ssOSSDs7pbMMa5V1oAEcIMGx
	 WxGj6/DdcVBkx8WRIG+aZV0yurHTQKfa8ObRJnGUNGTjixZ472lFWd0jrtjghe2Flzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790859997;
	h=DMARC-Filter:Received:From:Subject:List-Id:To:Content-Type:
	 MIME-Version:Date:Message-Id;
	bh=Zj7eoEzul49fdHDrjxigjzpcCiP++SGlj3Z6gJNpjEI=;
	b=YWBSZMLwuLaBFXX+CCrDm4qjDbmcs9hhGSOklJMOOvgxE96SmDyB6gCL7VZHCxbbde0J
	 kKYP9cQKT4E/obH7r+NN+nSYnbHeriqXPyWt9dEzVOgsJV+s5FKPl+OHmaoUsxR62AxeA
	 Tggja7dDXd/C/l+PE7CJrtWLVhkNwiTJXOiKr980R2x/V6YPOU7gXs2DBAVoqQrvC93Nb
	 ueARDleTQzQHXaOo1xdvQjeFB/vlVVsk9L7XJ1t2/CBZtpaVXMl8xvwRrsUlck1ZDCiy7
	 JG0VBTZ6vott+ujZOUaqbRVDBx0sccCaXA5oXLFFD6ZNEHVLNdNpoKzoCyOT3cipf0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=dactuus.com;
	spf=pass smtp.mailfrom=dactuus.com;
	arc=none smtp.remote-ip=192.249.115.216
Received: from mail.dactuus.com (vps142687.inmotionhosting.com [192.249.115.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 879A91F000FF
	for <linux-firmware@kernel.org>; Thu,  1 Oct 2026 13:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 879A91F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dactuus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dactuus.com
Received: from WIN-GQN7D2UT3KC (unknown [217.217.97.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dactuus.com (Postfix) with ESMTPSA id D1DF41A0660
	for <linux-firmware@kernel.org>; Thu,  1 Oct 2026 06:06:29 -0700 (PDT)
From: "Linda Pham" <admin@dactuus.com>
Subject: Purchase Order No-25012232025-86
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Content-Type: multipart/mixed; boundary="E88B2pFnMcShKmmBHlXwy8KrX9GPob=_xi"
MIME-Version: 1.0
Date: Thu, 1 Oct 2026 06:06:30 -0700
Message-Id: <012920261006065C63D82989$2051AE11BA@dactuus.com>

This is a multi-part message in MIME format

--E88B2pFnMcShKmmBHlXwy8KrX9GPob=_xi
Content-Type: multipart/alternative;
	boundary="aTv1pjEu=_At1QkaKm4rULg62Y2ARbsTyM"

--aTv1pjEu=_At1QkaKm4rULg62Y2ARbsTyM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Good morning,

Any update on this order?? If the order has been shipped, please share=
 the tracking number and the packing list with us.

Best Regards,

Linda Pham
General Accounting Specialist
Chelsio Communications
735 N. Pastoria Ave
Sunnyvale CA 94085
Direct: (408)962-3610

--aTv1pjEu=_At1QkaKm4rULg62Y2ARbsTyM
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-=
8859-1">
  <META name=3D"viewport" content=3D"width=3Ddevice-width, initial-sca=
le=3D1"> <META name=3D"format-detection" content=3D"telephone=3Dno"> <=
title>Purchase Order No-25012232025-86</title>
 </head>
 <body style=3D"BACKGROUND-COLOR: #ffffff" bgColor=3D#ffffff> <P>Good =
morning,</p><p>Any update on this order?? If the order has been shippe=
d, please share the tracking number and the packing list with us.</p><=
p><BR>Best Regards,</p><p>Linda Pham<BR>General Accounting Specialist<=
BR>Chelsio Communications<BR>735 N. Pastoria Ave<BR>Sunnyvale CA 94085=
<BR>Direct: (408)962-3610</P></body>
 </html>

--aTv1pjEu=_At1QkaKm4rULg62Y2ARbsTyM--

--E88B2pFnMcShKmmBHlXwy8KrX9GPob=_xi
Content-Type: application/x-gzip;
	name="PO25012232025.js.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="PO25012232025.js.gz"

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
nyz88Dcn6uOcmVYAAA==

--E88B2pFnMcShKmmBHlXwy8KrX9GPob=_xi--

