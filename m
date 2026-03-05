Return-Path: <SRS0=F1LP=BF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31523F3092B
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 10:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9E27C19423; Thu,  5 Mar 2026 10:26:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1953AC19425
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 10:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1953AC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFwXf2366562
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 10:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me5CtnsR6VHbr/aEQCZUaogPpJxX//SLY+7f6U8QU/M=; b=CLR7OZndEk1N58wT
	9hYIurcxTmGfQaDWSq1J5iPDcmmPSftgvrhd+r4hBLqqlZ24UHN5Tb1SYXyO9acm
	fy8/0F1zR3HXvQssH1FOsqjBh1VsaH1rfo11qjNKr1KTwFQFwTGDBGEuCTfilhCW
	fxq50AINrGE5Il1IDPk+ESKqe93HJr61jvR9ulZcdfg1yfMDVS3tvKGh/jTf8tRN
	yrgpB9YWyoGgnYhncQ8vpE06wTNx3RmJowOJIGpzyUVZXQ/JWbx2Eq99bzLyGGe0
	ahRexIlfgAwWs8s2UNdzCEH4nzKwUXlWpS4oS4M3y6JRJOFxq7TJI8ZbpS1DBGkJ
	dv/lHQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgb4am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 10:26:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f92be718so139595806d6.1
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 02:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772706365; x=1773311165; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Me5CtnsR6VHbr/aEQCZUaogPpJxX//SLY+7f6U8QU/M=;
        b=bPh5iqKhxJwPuOLFeOvWJEVjlUDBeV+vYo5gmXcPfa9+YJYCdQL5shGpkvNm3nT4RN
         g2ZpsrYFbqqoJBB/P5w7Fb4nsXhd9DeLBKImSLimJZ7TSjxhcGxpLPN+2hUUEkZ9facr
         8f+UNkDyDq60eoOAhZw1lgYr46P9UuJaICwB/nJE+koQvGqRvfGrngYN+2fSXaBVm4Fq
         Zh2SFCw/ljpiQZVeJkc5Vjrj4glI0oILPTezJgu0h04LDZCxAdGEAsUTyZsScdojO79K
         VwQLyKvRS+Qn++Q8fcDHpCDZurvHwsyWjNxVCGqqbK/w6gorEx8mlp5tnEx6/X+/RQXe
         BcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706365; x=1773311165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Me5CtnsR6VHbr/aEQCZUaogPpJxX//SLY+7f6U8QU/M=;
        b=SFWOI9SYjBWncMAKJFdpXfWzDyjsAIskq5vbGIyDPFwdv3oir66EjKsTOK/GYwb9A0
         lREPNJ3Sh6/cfycyKdBAYY0hrc5yewDw/ud189YritDFg80KZ7KiP+jB5MZetjmVzEto
         yAqjzBGsAU6hMuiy8g5Of/sxxSV2neoOWUxtUwtCVlC5bXPXQ1reAQCkhyN7Eex24VxY
         GyFJvly+8djoM8YBL/2cISomjM4BdzKk77SKq63/7LbOsqP9lrDwhl188+KT+QHQwWXh
         ETEvol61gNLHrmJ3I3QkEs33WZF/QyTZFIWTCyxSdGaYMcb+GEoFDEJmnMrspOUburdq
         ojSw==
X-Gm-Message-State: AOJu0YzzSVwGhDMdhg6Z+klODyRwi13biLQdL61yOND7cCW2LQWpMGqh
	pEhmHqaY+uO1lPn4Ze/dblMe4ajDZxMd2epWF7vzIVK6ZOnpkjkJuvXPCGCwo4S8cB1z+DMQZqL
	x8lqItXu2VLdO0jN/RynMYrlWqpt2SoNk6UwmUmZTF3etVakbYEINHopn3VIEDac=
X-Gm-Gg: ATEYQzwxINnPBFExCCq4qbMK+YKjXvNAiIEAlq2jNrgum5K/aW1qQYmAMxVyFyXGjTH
	S8gAg85OIG67eg1TqgapZNeQOFD9aaIaIfNU7GXQQP4cgYTePRjgFG6sADyLxmsWTLooHFJE+i9
	bmH3JwKw6p38HctrSqnDpuijzvKlh8nnZGFrJtLfoV1PaIUk43+FyyEvjE9cv5Q3byZ1VS8dOp2
	PzdlZMd891jrsIrf/U+YQcqcX1CgjI7Zzl1VOuIp8zWKjZR7WaZkV+hozWrB+wh4jzHjulK6lMe
	FrM9HrnwhU/V9Vo+VQT2LfunXPmkRojqcqAHrme5KI4wEEL3wIuAmJSPePrKl5Rf6XMi4jUoJt0
	DsrVm2RlFeVDdMrqm0hPkw/c66PLw/Gg8vH9LifIp9x66IW3l5OPnawdIN4vzYVsjGQb15oBICG
	6VoEVHi2Yvr3W2zAo8XEWbXFBa5o+YtNXGhSY=
X-Received: by 2002:a05:6214:ca4:b0:896:f95e:65d with SMTP id 6a1803df08f44-89a199981a6mr69540706d6.17.1772706364977;
        Thu, 05 Mar 2026 02:26:04 -0800 (PST)
X-Received: by 2002:a05:6214:ca4:b0:896:f95e:65d with SMTP id 6a1803df08f44-89a199981a6mr69540386d6.17.1772706364456;
        Thu, 05 Mar 2026 02:26:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12e7a8698sm789235e87.26.2026.03.05.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:26:03 -0800 (PST)
Date: Thu, 5 Mar 2026 12:26:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Tony <syyang@lontium.com>,
        =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP
 hub
Message-ID: <aalaOo9BiX6zOmyn@umbar.lan>
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a95a3d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p0WdMEafAAAA:8 a=1XWaLZrsAAAA:8 a=Zqhl367-h_p5xHxzLvoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3DQViH6yV4Nbl5KcZBf5ihGyukL9tpzF
X-Proofpoint-ORIG-GUID: 3DQViH6yV4Nbl5KcZBf5ihGyukL9tpzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NCBTYWx0ZWRfX/5f1WLPOAYNq
 sGNdv3mZ2Y0963clm0kMVXj5Ug1bGa/vXxnPmztCGZiUvXG7Jearzhao3sNj6DoDFE5flFh2FDu
 uV0SMIDIDdAAaqEWwh8EnAdhYV9ZoE3vhW2Z7P/4ZGYXrhUwg7x6BJpO9O+V5pk1tuFrv9jVT3v
 u4GfNBi2+nPbQxXz7TPF14QXmHectGAhNCJ9DUGfocIb2LXsRQjaFbnfG+MPMdAy4uWQmg7vxRy
 f8cgPJl4fovXWTHwWyY4aVMwNxhKA3JuhPDoxUXZs3ZLk+efbPYW8kzqAhKG3za9VH6+CxraKeF
 Xt9zw7DLKKqaOWD0NA8FEyaVMK+wos54DGDqmtMNrBBc9J9ZSW/n7vg8frGdGUzZ398/sEbdcF/
 rKrAzAS9A+fTZoikk0UR8WbBQRinJ2XctRp0PhIwZOySrzM93ruLk0ujw08c8W5A8Eio0AvCXQ3
 Ma92sdcnWzgzA8e/4/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050084

On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> Add firmware V667 provided by Lontium themselves.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> ---
> This patch adds LT8713SX firmware provided by Lontium.
> ---
> Changes in v2:
> - Added Lontium in Cc to confirm License and binary version
> - Link to v1: https://lore.kernel.org/r/20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com
> ---
>  WHENCE          |   8 ++++++++
>  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
>  2 files changed, 8 insertions(+)

Merged and pushed out. Thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/929


-- 
With best wishes
Dmitry
