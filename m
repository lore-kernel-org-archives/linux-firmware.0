Return-Path: <SRS0=x5g/=WH=opensource.cirrus.com=prvs=21743c15d4=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B73BC28B30
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Mar 2025 14:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3851C4CEE3; Thu, 20 Mar 2025 14:03:29 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C60D7C4CEDD;
	Thu, 20 Mar 2025 14:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C60D7C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K59Ska031179;
	Thu, 20 Mar 2025 09:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8RBWMtsi0V6/aFJ0kWrv8dUngtXt1V+RhwbR3Q+Nq5c=; b=
	IFeId/VQEHzqzOcSPEy/VQUDXsZLjg9loeSA4TeJMGs+DTFpMnCooxO9m8qIeDlt
	tuCHgrdgRjY+dXmM8NR5i3lAnWrxY29a985bLR6J4CEgVrrKSK/XkiWU3ysZ8Bve
	2dfRB0EE9GIekjiKVrP4JQu8dIOSAE4o1QBk36ijbUio2qlXmFTFhayR9safPoZ9
	PvDIQ2wqrxoBelhYPMG/P1wxQHm+yrGxpaWOo+Y/Gq8NyBJ6Y8LWIG0+ZQvNbS0O
	lZf/C21vmJrNrFYcD5gEDaJyrls036XrA5w1riUE4oFVCj6VB3kRoiu9H/j8lIHv
	LFdsnXzRZyZ55A9CAcuhWg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45g9p6s7hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:03:26 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 20 Mar
 2025 14:03:24 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:03:24 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7363482255A;
	Thu, 20 Mar 2025 14:03:24 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Josh Boyer' <jwboyer@kernel.org>,
        'Andres Traumann'
	<andres.traumann.01@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>
References: <20250320091503.16427-1-andres.traumann.01@gmail.com> <CA+5PVA6ODw9Mc-M1Vg8SQz7CqeqdhNbZc_cRxDkMXv7jTSWX3A@mail.gmail.com>
In-Reply-To: <CA+5PVA6ODw9Mc-M1Vg8SQz7CqeqdhNbZc_cRxDkMXv7jTSWX3A@mail.gmail.com>
Subject: RE: [PATCH] cirrus: Add cs35l56 firmware symlinks for Asus UM5606KA
Date: Thu, 20 Mar 2025 14:03:24 +0000
Message-ID: <000101db99a0$d89d0db0$89d72910$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEZm2mCEsK3Gc9vE8TSYd2qKIE2SALd3PNDtOkanCA=
X-Authority-Analysis: v=2.4 cv=Vcz3PEp9 c=1 sm=1 tr=0 ts=67dc202e cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=sdMtc752ZtZkUK89vsIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qJPu0y9BPYWyFDPJUgVWTojGKAlJtk6Q
X-Proofpoint-ORIG-GUID: qJPu0y9BPYWyFDPJUgVWTojGKAlJtk6Q
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 20, 2025 at 11:50=E2=80=AFAM Josh Boyer wrote
> On Thu, Mar 20, 2025 at 5:15=E2=80=AFAM Andres Traumann
> <andres.traumann.01@gmail.com> wrote:
> > Symlinks previously existed for amp1 and amp2, but amp3 and amp4 =
were
> failing to load.
> >
> > Signed-off-by: Andres Traumann <andres.traumann.01@gmail.com>
> > ---
> >  WHENCE | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 6b3506d8..85247beb 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -7935,6 +7935,8 @@ File: cirrus/cs35l56-b0-dsp1-misc-10431044-
> spkid1-amp2.bin
> >  Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw ->
> cs35l56/CS35L56_Rev3.11.16.wmfw
> >  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> =
cs35l56-b0-dsp1-
> misc-10431df3-amp1.bin
> >  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> =
cs35l56-b0-dsp1-
> misc-10431df3-amp2.bin
> > +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> =
cs35l56-b0-dsp1-
> misc-10431df3-amp3.bin
> > +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> =
cs35l56-b0-dsp1-
> misc-10431df3-amp4.bin
> >  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw ->
> cs35l56/CS35L56_Rev3.11.16.wmfw
> >  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
> >  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
>=20
> Simon, any issues with this?
>=20
> josh

Hiya Josh,
That looks like the correct fix to me - thanks!
-Simon

