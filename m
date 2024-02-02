Return-Path: <SRS0=IPmu=JL=opensource.cirrus.com=prvs=97625aa8a4=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA65FC48291
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 15:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A0F3C43390; Fri,  2 Feb 2024 15:18:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62E61C433C7
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 15:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62E61C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4128hWod027968;
	Fri, 2 Feb 2024 09:17:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=xhC9hWuKIqJT3iHwA1NBSceqewTZ5jGSoe/W410LgR8=; b=
	CTnvtMLaYoINXccS0r+Z+mx/SrpR8myfIpOeadmMbpYXPOglI/Q5uegJqppEc24e
	Lj+hck3T/O4f3uePZlCBUPDSxzbWvXZp0z9ZRP96VAW14pUMFLM3W/PlLf/ahWAq
	SPH6ETgHrJR6oWYbGaWQBoxHg16YTwNkZf4599EJ+b7MWuzd4Sm7apYV+cJN0SDZ
	lx054XpGC6jg2/fDPiNPQM0Oh7DMZoThrYlTkWvdUBx4R09A5CP7Idh+3OMBTpcj
	EabORZ8FPyNqV7LIy2HtdnBf5cPzR4eZbfNQks5/pozL+PgNikvi5K0ylEIGEVC8
	CVv4PwgpK4husovnR74BqQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgnj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 09:17:57 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 15:17:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 15:17:53 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.90.238.164])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D7001820246;
	Fri,  2 Feb 2024 15:17:52 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Juerg Haefliger' <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <patches@opensource.cirrus.com>
References: <20240202154032.52fb9475@gollum>
In-Reply-To: <20240202154032.52fb9475@gollum>
Subject: RE: linux-firmware: Duplicate links
Date: Fri, 2 Feb 2024 15:17:52 +0000
Message-ID: <002401da55ea$fdc930a0$f95b91e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIpZnV178tRxiTh0Vj0GCQu2uUeOrBZAjvA
X-Proofpoint-ORIG-GUID: UGOYMweMuq1J3JeYqCbfnPrgAtzqsaDM
X-Proofpoint-GUID: UGOYMweMuq1J3JeYqCbfnPrgAtzqsaDM
X-Proofpoint-Spam-Reason: safe

Hi,

Apologies for this.
I currently have a fix for this locally, that I'm planning to send
upstream shortly.

Thanks,
Stefan

> -----Original Message-----
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> Sent: Friday, February 2, 2024 2:41 PM
> To: sbinding@opensource.cirrus.com
> Cc: linux-firmware@kernel.org
> Subject: linux-firmware: Duplicate links
> 
> Stefan,
> 
> Your commit [1] introduced duplicate symlinks in WHENCE pointing to
> different
> binaries:
> 
> Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw ->
> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
> Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw ->
> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
> 
> Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw ->
cs35l41-dsp1-spk-
> prot-103c8ca4.bin
> Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw ->
cs35l41-dsp1-spk-
> cali-103c8ca4.bin
> 
> Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw ->
> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
> Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw ->
> cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw
> 
> Which two are the correct ones?
> 
> ...Juerg
> 
> 
> [1]
> commit 4f498d09a4a6a905f231a52f33886f8a5d22d5de
> Author: Stefan Binding <sbinding@opensource.cirrus.com>
> Date:   Fri Oct 20 14:58:26 2023 +0100
> 
>     linux-firmware: Add firmware for Cirrus CS35L41 on HP G11
Laptops
> 
>     Support for 3 laptops using CS35L41.
> 
>     Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

