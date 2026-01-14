Return-Path: <SRS0=d82z=7T=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19125D31A02
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 04:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF0A4C19423; Wed, 14 Jan 2026 04:04:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07BCEC4CEF7
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 04:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07BCEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHYtC1897634
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 04:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uHkowW3uP14kSwNKsH5Kv5e
	Egkm/mZq3hluQMB2+l0=; b=QPvJKoLE0Eh1xbq2DQShV2wM1BITjHhSqOFdoVG5
	T/dORBjLj8EjyF/aktZDMep5WQgb4Malbxl5VzR9Ej+hMhOZH+U5ASh9HxVA0/jG
	D3sFmXd4/H2fYgCUse5tkaFusb43Bhimeiwvh5UWWTYQG9NjzkRUX7IisbP4VcS/
	GLW4JdVIV6uxctLimlA7qfohiC5/yxtsSTldxNgWOhfkpmARYVUHe8BN/6nmSyX5
	wOH6/2taMGra5JoPaBTJWIRWhomR708UE6YhmCZPknDYrALOx0CjmwdaqSJhtwzJ
	8AqywcAzEitLks3YelIJKubfkbyKkodI6Idu55dCcXzdyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63sxdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 04:04:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso2484612785a.1
        for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768363447; x=1768968247; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uHkowW3uP14kSwNKsH5Kv5eEgkm/mZq3hluQMB2+l0=;
        b=M3dwR1eGz2iqwexlM7CQ0lIPinNy0mCSSZxIEPfJ+BITylzh/BRibBTC6U45nB/3D7
         N6lPqPJbq9W0wWQ9VmoOqqAdN618cfnfvZhZEM4Bdf4C4O2d40Fi34Qx+Qva8Bmk2oAz
         0VwE5vXJG0MzxHe5y1SXausWOCQeIT8y6806U/B8D1sYAfMRxp+1rVBjaE2Z9v+PjAf8
         hpuxH46U1lmW5jqi3AV3QbuMqYeQDAB/VLqygWTKkdkK9+faD1pW0cDW28sjMYygQ/Z3
         muylON3pehUwIgtV45xtZykVkNdq/tnB+6hNfaBy8pSReUv1XIyFNVBce2XY4eYQ3P4T
         WUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768363447; x=1768968247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uHkowW3uP14kSwNKsH5Kv5eEgkm/mZq3hluQMB2+l0=;
        b=r3IkTN9PkL5jYTCcIZdXhH8HHOVpw/dxjIKh9LIdUSUhWbzd0DRV82wT3ZTfA8ARxq
         +RAIqKyZig1CBfRBem1zX31gc99xasZuJxgd/DEZafjLrOSWRPhQiRj0nETidkawk38Z
         O30B1MY2MWw8jV6qYwepfc4KqEk9HucTCQiOq5BsdQQD6kt91ZQ5TnZy77OICIPZUD/L
         OqUGijBP4RZDARhkP0iCl3/QbzwYi24teZyq/kSAM6U5z0gn/7yfjZr8Xv3q+P5UBDIU
         OysT8vAG6PdDchcjHUErxcQbNKRfnkEy8N61rnTgfGImhdXlvZm7FsoiecOiE+EQ7DSa
         B10g==
X-Gm-Message-State: AOJu0YwmC2NaXAYp14rMlxz9HpKXMf+xWgkd6sajF4BzH4GXIweqdGjo
	OJ0XwiLspcYGdxxmKm4gJbCnbRbf8B8gmCjSdQDjijRS6eg2/QJ/MNWdDCWQmH+ap+fD6aFSQBB
	UL6ibju+lgUE7GjMnE9WBl0tpT/R1vvC9Q+ggtSIKoxPnLVbBfg7ktQNtYcjH+PE=
X-Gm-Gg: AY/fxX54WHGi1dwuFtK4UjvNlRCfJUNlSLWhWLDfAhjOvumVQadOGJMRel6cFNEGdOY
	UOt24GgRSsRgep8a9BwJVzFApibqcyrhFO1hcR86LMMGDWqVbVrbkIoLMo0N+OTgw1ZaREOBFlS
	Df51489na9+1f7/4UrrfRjpl5MsxQSwXEeCAgiD/W5cza3dmGT9ykvgA8MSO9Ho+mYOf+pO+kXK
	1P2paCw68qGfUQyF3W008ZABcxgMT8P3S+i3XmNxrdO7Zph3T9QDzuQvsNdguEav3O/y1wsg6HP
	qGPuH5M+Ae3GnVE2xwgIKTkHfW0n8qezHuS6SsfdfEoKbG6Hpu9mKrpVtJZjy0oxjpzJTjcG2DT
	goapCXSReH3Y0MhQyY04kJewYHS3aFvZ9juXNAU1O4JAXYsHxIwe6KAzTgUkIw85QcImFtSuxBY
	TbKhlUo/m/QF5/60IQy0dTL3Q=
X-Received: by 2002:a05:620a:f12:b0:8b2:db27:425f with SMTP id af79cd13be357-8c52fbcea36mr204430885a.58.1768363447032;
        Tue, 13 Jan 2026 20:04:07 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8b2:db27:425f with SMTP id af79cd13be357-8c52fbcea36mr204428285a.58.1768363446594;
        Tue, 13 Jan 2026 20:04:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102092fsm304593e87.30.2026.01.13.20.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 20:04:05 -0800 (PST)
Date: Wed, 14 Jan 2026 06:04:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: mediatek: rename MT8188 SCP firmware
Message-ID: <3vphktkj4jv4dymnorkruxxyayivxn6e6n63sl5iweo4jh7csl@5audwfacojyx>
References: <20260114014131.2933478-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114014131.2933478-1-moudy.ho@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAyNyBTYWx0ZWRfX/bPQoStvbzNg
 WBHVaxe4qEBiThbYSBtlwrWjijjLC9zWa3/bOfgQqsFKzZ/iWvGS6R1Gs/pGhCzQxU4tpdd2cIM
 CD5ujvsRw94gsr26+ypSeGzevyraKDJHeSQADxnIPipXt+i9wGyg98c/4cqnnsBrGBB23vuwqF1
 8PLOj/jOr0f2HpAWeM4WFPZ9BSPAlPNmFBc/kZ37kG2E71FkJCD/0gckX5TtHohg2XyMIoGP9m/
 n9q3mbyLhSmfr3q7DYpXcevCQtTwO7f/scs3PpK3lhCuqs8Z+LjSHOEV4vkGJu4n4s3gRLVSUwJ
 KYQ5uFVydDYGmhBa0huLUdaQCB3J9hOtR7t7lTJcRyrJ9XpqqREOEbtMcmp1hhXxLRQvNiTZKAP
 fJGQsOlmX6JWbx60UMicGDsqaewYO7kidZ5D12KQhkSCSSzFOoLmlNiBqykAOuiEqCOH/qOR9XA
 Qyk8vmxIHBNG/NN/o3Q==
X-Proofpoint-ORIG-GUID: xoLkI9NfWD0kpL_R8POwYRHuWuK5kjd-
X-Proofpoint-GUID: xoLkI9NfWD0kpL_R8POwYRHuWuK5kjd-
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=696715b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=q7cfFwRtAvyWHTVURH0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140027

On Wed, Jan 14, 2026 at 09:40:42AM +0800, Moudy Ho wrote:
> The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:
> 
>   Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/MoudyHo/linux_fw_scp v27748.04
> 
> for you to fetch changes up to a27572bc81d5073e8288c1b8a78903a8ae20478b:
> 
>   mediatek: rename MT8188 SCP firmware (2026-01-14 09:09:25 +0800)
> 
> ----------------------------------------------------------------
> Moudy Ho (1):
>       mediatek: rename MT8188 SCP firmware
> 
>  WHENCE                                  |   3 ++-
>  mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)

E: target mediatek/mt8188/mediatek/mt8188/scp_c0.img of link mediatek/mt8188/scp.img in WHENCE does not exist

-- 
With best wishes
Dmitry
