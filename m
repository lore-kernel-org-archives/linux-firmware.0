Return-Path: <SRS0=/yXG=7S=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96E2D29DD3
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 06:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3415C19421; Tue, 13 Jan 2026 06:18:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEE19C116C6
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 06:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEE19C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1tdBW2751746
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 06:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=; b=FAqcoOwNekn61BAV
	2BTRqQuHvQTF2U1dfvm5UxdlAuH7CIwLSjoow+WaRZHIs+CXMq4HpeI0k/MPKJmD
	W0AXhSVnvZ3NzeGOPTQMYdMqEWv/Kf34mWQDDgTmhvj+QyUKA7M8aSArUnWfKX+q
	1VPNGlRnPi0LO11/GnFYQIF1dXqK9GeqXPpvpK3faT73kKGoc3ToR7QYfP76U6G3
	75/ayrcZdfopkvvz2ydM1le8uOYjITq5ntk3lznTj0q+lBO0bdEwBBztXownVOX8
	q9lvMuGnr9dTIwpPJV0/hRTfNP4Xtt1H+7R8dbJWBjBFawRkSlvQFjBAOz/0JwD6
	JhIqyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjrmf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 06:18:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so1980119385a.2
        for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285084; x=1768889884; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=;
        b=A+YpzW5B1Jyu5SahKQMQkCqFs7L1vhLhSAl1SXwrRSLZjPHpJWH4QmPfqewQTA6jhe
         /nCxbw9Gx9S6MmLpj2Ce+Ph8QPT/xI1iIu7riVpd9tpP+Twb4uariWymcAaSqRBJ5MLe
         YS6omrp7uZU+TRP5yG7iFJktfTbo5wdmqYobhSe0RTuBSa8F3Y5T7aI8xkwljlwwYCp+
         5Lrf3rClyaiuWIklnfg3ONObZD7aDhMTd0QCcO68CY+WHXaiMGNo8B65/dE794iRVnHe
         WRqVeUCfXAG0rwPn5cMxeKHdLSfA3it0bsk/tjrdDxJcdRGaqGYxpFD+qc6Xh0MNsaQ5
         1MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285084; x=1768889884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=;
        b=WoubezTMU8LCyd9p77ObHww4gpscW5e84qMSPHhMcdLvwUeRVo7c9DqUPwWMAcYxJ/
         z69Voq9ml4R4D0gqrgsss0wgVjC0H6NnZzDgnYWaS6/0DdqL1mAGjS36yDkbuKo04H4q
         zYAOTRZ7GmBoGbHSgzeSgJvIKtPOdx7IoOu6IebEBZ4wUdyzNl/DqDex4+pXd497h+0K
         Zn4RMLi5/fz6o/Y1l5e1+RU5CGh8JtHIFhtSvDpKm0ZKPsZ3SZtZiQF9hYXEilctjjIi
         K/PvHG9TBOAfziM9vU8Q2tUNDPHbw5GG7w0B9DNDKcbcBgiaCe2Y/vtjAEJLs1PdvS41
         /yjw==
X-Forwarded-Encrypted: i=1; AJvYcCUpLx+OgN3325qO8VtGjBQFjlgZI13clPX4PZHKUnulcHvMC33aR5DEx+96Pib6F0tTyEclxyDR7NkcmbkjpA==@kernel.org
X-Gm-Message-State: AOJu0YxmBkPaT4F+pJhltM/83Bue41FajUuDKA3EjdOObSFewwq08SNc
	xGihLAgDokjHhnHE9h6Zcfc/XSMwB6GrY3Zm+sGbr2iF9G5Yeo8a9EOVRBWrF2NelCOR0og56Pw
	Bgfbq4R5LD5JIrWwM41NKg/t8LeDBG1xvhcbD5h1qDNCh4Ek+CloEgmSpoMS0JKw=
X-Gm-Gg: AY/fxX7zc8wNLomS4ztAUMIY6sYqpJ0ilo1aNb3nGo+6eMHudOG7tDvx3gt9lOcra4Q
	jrfTIdZPM6OcRHMzEmsgwYb/ek2mdhUpbJ/VWCsJfHh6y9/n4c5xSj2IUbvxcf8qP4y0T7MqBii
	ztDyTtFHCfBgMxfsJ/pWJhNdQEjCPEIp+edthlFZ2IOCtPQIHykUwHU00eSIwI4c6uuIWtqIX0V
	v77B1VPYDbiFJ6SNJ8aGi4a06EhAyKLs0PqrEdZy+KtR4DVUUeBtRheuRg+Uj1UmfUuI+gnTtan
	qK0z/sIiuMV0mbq2bvivrhaoH7faO62bDuA2EPvBK6YVvPXz3bjA0CzqCHzl854Z1+B7y2sF642
	5DKrQH66BWnUoLGg2lz7tjSyeeM0BsG5bvdZDgTrAojS1IG+MaGuLHUx2HD6w62MBQBdLyWHrgW
	QSCRVNEoCiow+bIP9fX04r1qg=
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr3080932485a.68.1768285083672;
        Mon, 12 Jan 2026 22:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjw+a8tp4voeRgDqdbTfRzcx5M4ncIYkxQri2oil+O0LxO8lbHuQgg9mMDggDoxzovc4IKtg==
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr3080929885a.68.1768285083239;
        Mon, 12 Jan 2026 22:18:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b728b5b01sm4279526e87.88.2026.01.12.22.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:18:02 -0800 (PST)
Date: Tue, 13 Jan 2026 08:17:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Moudy Ho <moudy.ho@mediatek.com>, linux-firmware@kernel.org,
        linux-mediatek@lists.infradead.org, nfraprado@collabora.com,
        Jason-ch.Chen@mediatek.com, angelogioacchino.delregno@collabora.com,
        Macpaul.Lin@mediatek.com
Subject: Re: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
Message-ID: <or7l3unt5unsxzktzvgqj2sqzkdalwt6uojbbcclzmnrcqhm2j@qzbdazvmvswt>
References: <20260113020959.2377348-1-moudy.ho@mediatek.com>
 <20260113020959.2377348-2-moudy.ho@mediatek.com>
 <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MCBTYWx0ZWRfX13IGpalPuL5g
 43raqWVplfVYOqkUREzcbwqTcTcQycECcvGAMkU+fCMFbra11OTxdR3m7Ih/0yxFZJr9D4u/85n
 KEs+XwPSFJHnUqtRPhp/p9BEBaErjvsLtZxidsPBgYbae+tyWZGa8yR2xDmDm99wBz8Se/eiMOQ
 AeK/kAzhsjESAxmcmZQzrF4QPwyg8n2GRaJFD+2o+c60HwWmjXy9RyV4u30z4+eOT01u6Q5bBVH
 6F5GlPkDFw6USg7sadH/J7gk5iB7WYRiX2QCyzOBnAkHzVe3bqe+niMNif3CNxwL7je1ONd6OvN
 TaoWOmBCstY8E9+KdTSfISMYRby2Mi4AD+8G5KtSeWIm9qgVP9/vdd/59Me/f6oykkvKXTE6ytx
 NaJPTZyJofdsEDWE7eEUOKQTKG8BqV5odkf8kKryc/fddMT3EYtUVqqmolVDj9fstV0BJf4/fM5
 2y1P5ZR533XJeSESJxw==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=6965e39c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mpaa-ttXAAAA:8 a=ndEMzMApqRaC5L4qs9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iyCls1BNRAyXLQUCm7Ol32-xlzVBx-6n
X-Proofpoint-GUID: iyCls1BNRAyXLQUCm7Ol32-xlzVBx-6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130050

On Tue, Jan 13, 2026 at 01:15:21PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jan 13, 2026 at 10:10 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
> >
> > The MT8188 device tree (DTS) is configured for dual core SCP, and the
> > driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> > Without this symlink, the firmware fails to load and the following error
> > is observed:
> >
> >   [   79.494105] remoteproc remoteproc0: powering up scp
> >   [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188/scp.img, size 636548
> >   [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
> >   [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.
> >
> > This patch adds a symlink "scp_c0.img" pointing to "scp.img" under
> > meditek/mt8188/ to ensure proper firmware loading for dual core SCP.
> 
> It should be the opposite. "scp_c0.img" is the proper name used upstream,
> "scp.img" is the old name used in old DTBs.
> 
> So you should rename "scp.img" to "scp_c0.img", and then add a symlink
> "scp.img" pointing to "scp_c0.img".

ALso please use the Link: string inside WHENCE file instead of actually
creating a symlink.

> 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  mediatek/mt8188/scp_c0.img | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 120000 mediatek/mt8188/scp_c0.img
> >
> > diff --git a/mediatek/mt8188/scp_c0.img b/mediatek/mt8188/scp_c0.img
> > new file mode 120000
> > index 00000000..8d1dcd4d
> > --- /dev/null
> > +++ b/mediatek/mt8188/scp_c0.img
> > @@ -0,0 +1 @@
> > +scp.img
> > \ No newline at end of file
> > --
> > 2.45.2
> >
> >

-- 
With best wishes
Dmitry
