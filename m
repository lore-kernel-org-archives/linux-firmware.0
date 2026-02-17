Return-Path: <SRS0=RSEr=AV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A9FE909B9
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Feb 2026 14:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C0F0C19423; Tue, 17 Feb 2026 14:57:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E7CBC4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E7CBC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8IZIr297036
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f5HaP5vww5q+R+hCXpnBrydz
	OMcgkvZ557ZH/iEXla0=; b=kvNbqhFr7FvrMAoMeD5Zhla6rmh6x8SBgkbh5GT1
	MOqN2LQSfbhLlIrlu9xVKepPBYLmTQGSXFpQPIXdWdEfV3GMFjfg9R9okDQeW2Ri
	Nk6Cq3kHWlzTfu7ukUQx/+sMrrvh1BeYbaGea6wNucdSnL8+OLN05tsahWHmOoea
	aFY0a6p380PDhTsON4x5EUFYR8eXFgdO6h3Ld5BXCt51tzgcUgREScB5qmJfcMQG
	foazX3dQh11Kxg4OiXB5wEgFfhatWbE2Lvp1LYSDGnfmpNji/MvI/wxAshKGKVkX
	6wQhPOyZW/Wvt3DEys2VKpdUzJyGMfMe7jse4iZB5xcEIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9ts2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:57:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so3541643185a.0
        for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 06:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771340274; x=1771945074; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5HaP5vww5q+R+hCXpnBrydzOMcgkvZ557ZH/iEXla0=;
        b=YxcF8LwsVSlLp6T7KMBXVOya+JGIQBbSdtFEx/XV/pqVVbtYgh4Jcy0PWRa3PbeDrt
         finnYVVHB1tIjbeuU9Uee1uR48Ym/UUCuRnGs9W6O8wEmEyM7UAmfP3Zg9UrLhRDBoPr
         u3KlNhzzQFgKFMYpXv7zDxqIDWROTndRQPx92YW1p3AyJOQwYK6ekByuz04YRii8qpC5
         FZPLLV/GEDJnU2YxlZgqsZdBfLcz98GOEuCJS21vD0l/1/U4tle5NOhAtcQH4dASe35S
         //gQqhEBJtMVK66ACqtYKIymJtinjZdt3+yp4K6Sk9wsw9EmgVCmoea1EBLAPln+sUh8
         /FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340274; x=1771945074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5HaP5vww5q+R+hCXpnBrydzOMcgkvZ557ZH/iEXla0=;
        b=QrdFpik2HhFYutJxxj6F8/YLF2X9Lvdf78GQPADqpCrNDMd2oz+EsE13KzP/iZh3Ir
         ULKOURfgYnHs/rVAnuNtvnYEBA5O50zZZXA0E++Yhf43Zta2HveyeG+JViiMArFI3vEL
         SYWCZqrQ+1gHz6/LJsTNmFMFLGeDu+QX4xH2/GwdmR0ybjQoBP8TdJZfgCtQ/MGUpQIZ
         qYwmUKOXFdA7OyjYs9CNL0LqpAenykLkEDI80gQ8SOuIzBkTqGqlzLZyssXr7WFDQbBw
         zjQrROL+0D42APjaXEv6KwlI1EjUU72XKjqxs6UjguI6fJ75W3jNV59m5Hu3tUDAy5JG
         GeKQ==
X-Gm-Message-State: AOJu0YxLl4tY2rdl6KsQw2wMbtETu5uZByL4F+dvHi99yHlCWXYthjdg
	BXvDSqy4qU1Vlg0aSl0dYIQvPfRn16W05TqELq2cgYYeddundnmDNd9wmXItOTlT0WrJ2K8jAzJ
	+gAJGUo6Uup2PReJll47NFA0U6iJqYlPV6qCLSBZDvNP6y3VeVH92oNyJkTUK9xo=
X-Gm-Gg: AZuq6aI4H0afD9kkW68tosrbzobM/1sDl8M21DtM71nho6NyqjmTkJ/1rsfEOr9Yy76
	ePUyzpKoYMiitNkZTLuPLtyCn660OTTcrRz1zjKHdqj4z+/w/8Ji6+Tv+Q3HYYd0c7yrgwA7fRK
	UskqrzmT3lgKBMKRQR/9WZOZ/3vGuiMXp1F8eYrKUEiVOloBLFnTb67wYV2IgOPLvSMTVvQez1T
	zrX893rj9WJiCP86lhkjs1rgFmyHSa+Q6T2+ZT7PEexTEZMFpuGP0sfObOkemht2aeHMQ66zyOl
	RAFMEGGY0+xvtaqho/zZWK+4bDAO9QWcqx0rkB+j7CAsQbm8J+A3TD77EJo/RbRK7ZMkOZfcPtg
	G69fV27pyK1k+ercO7KN4RGxyHxvJSqExkLAMt0//GTrekSbzac93VDd6HdJqrS3hu53/5PSeQ2
	KyFlmVaRfDWJLISTbpKEhkN9UIXDoITCLv9hc=
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1368002585a.86.1771340274418;
        Tue, 17 Feb 2026 06:57:54 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1367999385a.86.1771340273779;
        Tue, 17 Feb 2026 06:57:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b051asm3859658e87.72.2026.02.17.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:57:53 -0800 (PST)
Date: Tue, 17 Feb 2026 16:57:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, prahlad.valluru@oss.qualcomm.com,
        Tony <syyang@lontium.com>
Subject: Re: [PATCH] linux-firmware: add firmware for Lontium LT8713SX DP hub
Message-ID: <z2msqfqgx37sltehgpsmux7bcygt5essnlked7ohs3m6h272sh@t5xsitfzajbw>
References: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyMCBTYWx0ZWRfX/ZhbhtA1UbMt
 J1KPMFbuVUVVVx/RSJdHbRpx3fj2DWUS9cpLcHzjguGzNeHyZezFWuyd3vcZ27hFDRfhTd2ocNT
 otL1kfKvEYx16mhg9A/cHVGvgqjroaJVFH0/b+n7wYS3TPJA0kq1qtAS6T8GTUHNAH+GEa+SBjE
 jmsjwF9NhgMWjK0hECrzcBc7vhALy5SX973lKNe8Ea1R1GMQNYdZdFik0jyV4FQL/dTkywaK7pT
 EdzG7+ckXfXFwP2WGDO/3rws4l7YoFcNtPQjdX2JrwjdzvOv/wSIy1Tl0in8/cagsYC3lWRtB8S
 Pj19GKysIsJHPCkRaBzMK2uE0NUx/NCEty0dmuEHpHyQsPSEcyhr5wwOhBhdjLSzvTSRo0O1w0V
 qjkJobseyWEDy4SFvlRD9bAbydUokL7p9loYMucYzBtU/tmY/+/I+hPcvKuuxUy9Tw0QTgxWzTz
 cJgIibjMdUNIiskHz3A==
X-Proofpoint-GUID: 2kuDLTKl7LA_58wFkKVWzbzfAPrTo97J
X-Proofpoint-ORIG-GUID: 2kuDLTKl7LA_58wFkKVWzbzfAPrTo97J
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699481f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=fTdQzPplwP-IDa2WEcQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170120

On Tue, Feb 17, 2026 at 07:35:41PM +0530, Vishnu Saini wrote:
> Add firmware V667 provided by Lontium themselves.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: Tony <syyang@lontium.com>
> ---
> This series adds LT8713SX firmware provided by Lontium.
> ---
>  WHENCE          |   8 ++++++++
>  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
>  2 files changed, 8 insertions(+)

Also, to point it out. The driver was submitted in December, you got the
feedback, and then you never replied to the feedback (nor reposted the
series). What would assure reviewers that this firmware will be used by
the driver in the Linux kernel?

-- 
With best wishes
Dmitry
