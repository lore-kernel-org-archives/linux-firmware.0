Return-Path: <SRS0=9cMI=DD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C89CD342C
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 20:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B313C2BCB2; Wed,  6 May 2026 20:08:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A10CFC2BCB0
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 20:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A10CFC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646H0hvU1953138
	for <linux-firmware@kernel.org>; Wed, 6 May 2026 20:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xP4v08QDGha9ykc7yVM5njwfyrdSJ0h2TOqGvhCAp84=; b=JCpUgfCS7Jobkb86
	vTcPoBFfbpRAtaIAeEiLa55YoaTIe8IsTdieLjvuKZim4OZzn651N/Ogswgh/c/d
	qn1ZHGG3Ph5hhPKQ01nD6fqGHa3BfyOd8ROLXF+G46gOXp8+UX28L4iUeZW/+WLe
	UgNSug5QScqU/Kdg4WvkwRo1a3oRaIh1uky1U9iH2UwCylTAuB9xQKVDTrkkwbBI
	GNu8eGmdT8PWqKWXhQ2xMiA5UeJU/eoBsjyqbrR89fgIipRf0W8Z9ItrMFiZEK+V
	bzCDzvZAXGQTWLYCfGZoJQSId+kBQFvnOaHNJwh/kztw0lyHziqexfmzTSSklGWd
	OK0FKQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc2872-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 06 May 2026 20:08:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62ea6ff1ca6so253756137.3
        for <linux-firmware@kernel.org>; Wed, 06 May 2026 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778098106; x=1778702906; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xP4v08QDGha9ykc7yVM5njwfyrdSJ0h2TOqGvhCAp84=;
        b=hO308aeVnzU1wMsEVHt8XSIKiOFukYRlnodrg91eH9X8pwva11j723AdnISD0nereV
         IzKGCU44O1CZjhZ9EokOInNA89DtC3NZiLOEYV7eBksSrNHdMc44a/HPn47Iph22gUBN
         zrGaKmtw2tgyu/sJWXUS/Iz8RZEzmypA90cq3vD56Otm6DrSjaJ2Kj1m28X2iJ8GLHW+
         nkyiGKYNvFOTST+cG8RgUB5VXxYJln8lYZKe50VamL2Zy0+1pmwH1LWjEElounw+OYQu
         /akjTZTZ3+7JZgDY24WZwmStclh6g680WZTIc8dtGBHR87eTrt6rtuJoJaG/pE7TdH0g
         dxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778098106; x=1778702906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP4v08QDGha9ykc7yVM5njwfyrdSJ0h2TOqGvhCAp84=;
        b=BUgXCLH520Lx3tkMBj4USp3x8r5lFzqwShWY2rykDMe2u/3AgSOKy14fQwJSP5mLf7
         08PLS9l231WSO0rlrDJpnmo20Moneo/WjM9LMhjU/t6hRXC6RuYIGFCywR6F1wLNTPTo
         KGhnoOGrRiMoLLrKPRqg67p8302suOjr79On7vuN/GYjxeCvHJ866V+J5jc7NdMCyQ8U
         nexWgEuA2MhxFgHk6lI4iVQr+rrXxr6sSjiR2mzYofPAL35TX5Pw/vOHIC0Ukp1nczkk
         jP0UpxoyrMMrKz4iCWN/EXsqw/4HWsL0T2kab66U0aMKjVTqAideyyUvbcfupNdta9Dr
         r97Q==
X-Forwarded-Encrypted: i=1; AFNElJ8OO7xxHIk3T5/PvSck8YtAODEfE7FE7yFcmh5KOnIYL4BbiQZ4XEDrhSDDxvrL1Jy/D5DS80DCe1vIBI5NWA==@kernel.org
X-Gm-Message-State: AOJu0YyX0GDPGDLJAF1Gc6NeBTbLatuODprFdgRlOAOb0EcXE6Mgt0Yr
	IFHlRBP41sXaWR+CaFWXsGvShxAswxhBv2Hbwz0Ibrp96nfPMCDUh+AxhdF1jtRuXjUuj4Mxgj9
	o71fURxF8NRDwWQ5dve7tgZNyJnPA5278ri5GovaMwn+xRpXLMIE75oa+fj6m+eg=
X-Gm-Gg: AeBDieuTyClZq6Yxi+3G2pSUVzljalsF4DjBs9OnPt8O6VfIkQHe0btmvC0ZBw4gpv3
	xxLz9gDgbVx6PzxUgnLyvQSOZ4osgx/MoJDaljGhbm4GJ/xg9SgpsO6piMmMEzNgiUCgIaJkpNr
	MzXNziudfk1qMDCpnBaNFbB1bPhRkeBXm49KAT+ndY/pTvle4SnzGHfQtDBIpiMU4vMl9wwun4C
	PbA/wmkPuRD9dVRpyfyYSRv/INa8CISgN9Psg326ia9NmUtjryJNZuzgPiVYzZBilhEBD/z1zW1
	EVA570fS+ULhfpG2u1rOXbbTA7iQPxQN2W5E2PiXO22ahY3GM+uEJAEceuyhwWcuwC4qhnD7jlQ
	mzLCOE+DinkplTKRpP1v86wGNUa2sHcsUSvBqgxVDWlxL0Ey2SBe0PDNG/AVUmiLmuISpSWU8qT
	h0qB+2dEdB6QHBbPC1crzSSrjz2ShFH/BtqjdPgCudQXL07Q==
X-Received: by 2002:a05:6102:148c:b0:62e:b716:95f1 with SMTP id ada2fe7eead31-630f919ed14mr2331631137.19.1778098106473;
        Wed, 06 May 2026 13:08:26 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:62e:b716:95f1 with SMTP id ada2fe7eead31-630f919ed14mr2331619137.19.1778098105975;
        Wed, 06 May 2026 13:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5085122e87.29.2026.05.06.13.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:08:23 -0700 (PDT)
Date: Wed, 6 May 2026 23:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: syyang@lontium.com, linux-firmware@kernel.org,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
Message-ID: <uprzduq4ct2dpkwvlbwxw43b77yzubjwkzvjhadlkoajmbbybe@3cygq6vamfy4>
References: <20260506104934.82275-1-syyang@lontium.com>
 <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
 <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
 <CAFQXuNbWQQN0U+s0K2XV7hy6ow3x7RAB8Q=nxOvsWENDAE=2VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNbWQQN0U+s0K2XV7hy6ow3x7RAB8Q=nxOvsWENDAE=2VQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE5NyBTYWx0ZWRfX+DaR5UJe6M+x
 WGwxibZyiQCa6bu/ulNSfO2x73kxKMzWgZKAZ4MlXnmq3/NHv4yqLGPGh/78tISYyOjlzsDSp4w
 f0kCi1B9utEx3DHiuHDyQzzLMcN9U+aOAHXovoBOnXsu5WtE2n3Vvnv0H2C9rT2NvpWhJPqbn/v
 f1pLaK1dED+dS5heqEFHsQ8GpSkxdUSN46+Wz10LjHXnEN+vGZRcBmnpuUb6nEeDCQ382hLOw56
 V+qlGq2eUlgINnekIYBdvNX1wO5Tl3e2Yu+pOSwybGj6mvGvrCf+sap1rmkoadRU381UqyU03UJ
 uFUBvF0xPQFSGhy7pAl7yxIxU1MNy3IKn4MU2UTqNGL+9AY7xlIl2LlEVQeZp3ej8e2cE/Hgd7p
 0CtfZbGcaV6nMXmqHm4Z0D/mptXDmwN0FSWFF7PnZHyFM6TOL/qbMy/e9zujNQ3PPkILFiONts+
 wcMkTpFIn5J2/dja7Tg==
X-Proofpoint-ORIG-GUID: a3tt4xzaIwNjXQmCwCK6G0ED-urfOtsq
X-Proofpoint-GUID: a3tt4xzaIwNjXQmCwCK6G0ED-urfOtsq
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb9fbb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=Kz8-B0t5AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UJOyPSqEGr5DoIKyLcoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060197

On Wed, May 06, 2026 at 08:01:46PM +0800, 杨孙运 wrote:
> 杨孙运 <yangsunyun1993@gmail.com> 于2026年5月6日周三 19:55写道：
> >
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月6日周三 19:46写道：
> > >
> > > On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
> > > >
> > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > This is the firmware for the Lontium LT9611C,
> > > > which implements the function of converting MIPI DSI to HDMI.
> > > >
> > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > ---
> > > > Change in v2:
> > > > - WHENCE
> > > >  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE file.
> > > > - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syyang@lontium.com/
> > >
> > > Why? The rest of the Lontium firmware is in the root directory. The
> > > driver also (IIRC) expects the firmware in the root firmware
> > > directory.
> > >
> >
> > Our intention is to place all Lontium firmware in the Lontium/
> > directory for the following reasons:
> >
> > 1. To distinguish them from other companies' firmware files，such as
> > rockchip, qcom.
> >
> > 2. To keep the root directory cleaner and more organized.
> >
> 3. Clear organizational structure
> 4. Avoid root directory bloat
> 5. Improve readability
> 
> That's what I think.

It's all fine... If it was consistent with the driver that is being sent
to dri-devel@. I'm fine either way (and yes, having Lontium subdir makes
sense as this is the 3rd one already). But then at least drop a note to
the dri-devel mailing list that you'll send the next iteration of the
driver.

-- 
With best wishes
Dmitry
