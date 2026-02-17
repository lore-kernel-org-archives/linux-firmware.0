Return-Path: <SRS0=Uxd5=AV=oss.qualcomm.com=vishnu.saini@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7734E909C4
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Feb 2026 15:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE13CC19424; Tue, 17 Feb 2026 15:49:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D07C1C4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D07C1C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HCwr6L1232466
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vtUeUBIupeCSGpC5y4aTXnxM
	j8J7PADCXCcpxmzdSOM=; b=TgprUXu4z0X2Q/dYm/QcMzzvh4yPJYTiflxLSXxe
	xAmNzYECoP4m7jsAepSCM7MwDjC4ZW371StqWOghYUTco7ji1NMgi86L2lHsXXnd
	Z13doGzlwutxoQ3Wumu2/smdIY+hqxNpjk5W8We68ZIkUczuTh+YZV81r5ZZf7gp
	8clMsWxRi4YTEe+4WeZ0XYoq2b9dWD8fBd+eBsZb/M/GIpLD49p7oUGeYyuCPkaM
	U46JuiYfvFOByRxffUJPp9odGLGfiLoD4iqGG0yJJ9dkKpZrq32xsJe3dDqmE/FR
	oKvZTQ5Jx8WebGEbJHvqZCaLvOCQZQahMEGio7Z+lqZl1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca362dnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 15:49:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8a03b3319so20985095ad.2
        for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 07:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771343361; x=1771948161; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vtUeUBIupeCSGpC5y4aTXnxMj8J7PADCXCcpxmzdSOM=;
        b=CDM9fCRd+A/X8twOQsoiL0CgoQh7BEuDq4kQv/FMHnCrVPH5FT0koJ3f300FnE/V7s
         Tlly75s6dz8NhsxCdOMafxHpYtDWv4AxYyEQ2KdlOMLV8gXC2aRTjC/xMosoXMtz76DV
         lJ4YncWPmiWRvEVKlC8vXH/TdXMw3TaCy3w+KBW6iDr+aE5gQ2WNzV3TPJ+EU22qKOcP
         35ipXVPCnnvfGffx32T3cDkK41fR3JIAD7E18J9gBfqLyztVifQxlhVVbEqDL7WOAW7h
         yPqz2FSKyZJilMjdrJmrFWSVc3RBrUYtAh/YqPHht2jo/HB0nN+a1iH1Z8GrdGFptPy7
         XLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771343361; x=1771948161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtUeUBIupeCSGpC5y4aTXnxMj8J7PADCXCcpxmzdSOM=;
        b=FGf4QWKvUEjGvHdq4zzxNy/FVikBr+F8cFtNIFviuO5uqPH+3SZ5pDeaNHM8tY/Jsy
         xoomRDcbyxK3se0SGt4bq4bKtYQAGVm+s9IFPAzLJwBjKmB/U6uK/mHJbvyxf78kik2v
         penGCNCODgccOsKUoP0lODZo9OjaiXKwgAA88zm1q4nCKJ5UUmS0Im1vBjARQuZNoI2K
         QuOsRTjXd1TBVLC5EmnYl0iff9RchxVBtcG1DQ9iAbJgZEauTyT7xK5TXHFoBbeT5T6k
         2xnXHdhbCCBBWyioYDVh9cyIIvO2xEK33pTlI25Sdq+YYyqsgRfMM13JinMQ5kKN3wBm
         sxBA==
X-Gm-Message-State: AOJu0YwLqQ2gUfhHG7lFd3DmFeUhNy4VTLhq9/v/dOxAhLNOZZK1+vMB
	GUflLPOzVQkO+gt76F2dyq+qBfnFZ/i4S12oIFKD6f6zW9ZulZf3nl996Q63XnpBUL4UmB58xde
	ziOwsU2shBA8yu8fuFAlpYpB75CcUIog5L5Vm7F/mP+6TY4W15CpTlCw2eoGNAa4=
X-Gm-Gg: AZuq6aLgG/YbnVmJ9zfyASUbQKMi4q0DjBGyGIS5aDEhaK4gXibFo0Lbe/jsMehulMN
	tqt8+b8ydUQd+dc+KpGfdS2eHPdmCghqu8rXuI8JJtzC6Uz8MwRBUzFlwJI8pFl3g4E8WYhldgn
	y2tGpUfHkMeeKjpA8N1STkIHMOfrkyjura2pSla7I5JFEo9AkUQ5o28EI5Ii3+asf1e5IaQ3MLE
	Yn2nSfrjH0ccy+lreyjXHIKsC101jkb/ATuE4TE5fNVPgmi/fgVDUDOxQnTo6P29KfaNDTQyuim
	dQJNajHxyvK+HG78jXmeao4JjHkvPWcsZf36o8Mbjwu4yLHorkS0p79pv8SvMv+pom47rcI2BzO
	LHA2o9YfstHEcoHduqgH4AhnKmBaMq/dCecBMvdrFQ7vtdODqe8Ws4/UG4qdhISAo8tFxpysMyD
	mZUmswg/n+k5gXl+LYBggYvoosxbprXY1zbWEJ8BZSuw==
X-Received: by 2002:a17:903:1983:b0:2aa:d3a7:621 with SMTP id d9443c01a7336-2ab4d019648mr107406575ad.4.1771343360985;
        Tue, 17 Feb 2026 07:49:20 -0800 (PST)
X-Received: by 2002:a17:903:1983:b0:2aa:d3a7:621 with SMTP id d9443c01a7336-2ab4d019648mr107406385ad.4.1771343360335;
        Tue, 17 Feb 2026 07:49:20 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73053dsm111253335ad.35.2026.02.17.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:49:19 -0800 (PST)
Date: Tue, 17 Feb 2026 21:19:16 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, prahlad.valluru@oss.qualcomm.com,
        Tony <syyang@lontium.com>
Subject: Re: [PATCH] linux-firmware: add firmware for Lontium LT8713SX DP hub
Message-ID: <aZSN/Bh8ldWErTdQ@hu-vishsain-blr.qualcomm.com>
References: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
 <xnvt5hw7uxtvi4fpuqytnbg7s53r6is64kw3eq67i6roj4sgxt@mlizgss42vag>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xnvt5hw7uxtvi4fpuqytnbg7s53r6is64kw3eq67i6roj4sgxt@mlizgss42vag>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyOCBTYWx0ZWRfX0nIxqZCh9wG9
 u1g2tLYZ4nf5Gr+aJ71fZ+ZxZC9jRtUXBGGXCrjImZb4YjeNWq+E1fOUPCXerc/A+nazXQ0cNSt
 86BJ4uFTKmRNCN27S9L2q30Rx5TnrFCjsMXUuki3OfZ6xeFp5R99Qx+HC2B0NbODnnPYHfdeY3H
 wigrMRbrJSulTiqQtbXrSSLUme7xeVgzma6hzx6U4V4izO0nhF5dHdAZOYlY/zAMv7E2THuLrDf
 UY0iIAd7VhUUKkFcb3HUk9Yre+bMDlt+N8MOB2Jt4pzJZvXbjc9jzHqjfOv8hQQWOlkYhjDUErW
 +mI+plrZXDFDeOIodPQnVdu4thF2k39LMHEnUHmJ5LSPB7clb9BcgvWANrZMnjpt7RsyNXkx28D
 O5G0gyUJDlRJ0G6cLrTYGPUvycE1pbDMnQ1ibInaHVvI3gxNUmPl3xwOx1uPbN+9gc4brtTjNuz
 mDjenk7u8P1zNebuQMA==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69948e01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QxX-VftHyngVCz1nQowA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: ge1wYyTYGXPvILUdJQf4f_bPN6PoiNOQ
X-Proofpoint-ORIG-GUID: ge1wYyTYGXPvILUdJQf4f_bPN6PoiNOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170128

On Tue, Feb 17, 2026 at 04:55:18PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 07:35:41PM +0530, Vishnu Saini wrote:
> > Add firmware V667 provided by Lontium themselves.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: Tony <syyang@lontium.com>
> 
> Would anybody from Lontium also sign-off on this firmware (can be done
> in a reply)? Just to be sure that Lontium is fine with the proposed
> binary and licence.

We received initial version of driver and this firmware from lontium.
I will check with lontium if they can replay or sign-off for the confirmation.

> > ---
> > This series adds LT8713SX firmware provided by Lontium.
> 
> This is not a series.
Right this is single patch. will correct this.
 
> > ---
> >  WHENCE          |   8 ++++++++
> >  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
> >  2 files changed, 8 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry
