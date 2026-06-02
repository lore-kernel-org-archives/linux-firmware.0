Return-Path: <SRS0=WpwH=D6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C66FCD6E4A
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 260381F00898; Tue,  2 Jun 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780405295;
	b=a3pD985cvPUDnEq5MH40DM1X6qhiiMNYftJgt0GPnpcN93n2PcbM2FA1xj6Qmhd68n18
	 2Q6I715ENgKxQgQUAoFVYvVOtRcmsXhkdartxXPdGkTCcT3j3mRNa2EjAMKan6EeJ9GYZ
	 NOrp2DlSg1Ae/d/EkJfComzKbZx/934rKiPC/9g0zUHwroNd3j2DQfQbJeeIfwZiCX06s
	 qsjgtFsUOQA7l2OUAeVBrEH+acKMsWC7sSelxCTQqMc5aTlpbCoenHWu0YamJh3nyDmBi
	 GsYgt4czGj04s9KbYZdIUym9B8s4GD9xNqDePKOjLt/dOrhR6IVFKPQoKgRq5ykhT7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780405295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vaZKnmJ+/6YVnHKIJqf9z4v6CXPf8LxE9YwKtDn2GLg=;
	b=2JHyKKCIS69nRK2l+QzRKyu0xpzdBaztUQgYSQZKsF+ZmU2Rx26gVW4DW1tPoydiVYNX
	 XJg+CqEQ2koqGoQT83uGpxmhl1rqJDeeIgsuubGzxI/zDcBoV+KEIodUIIzhSrNgSL7vL
	 ggfmy5T2odHl+j+ex4TWSwIXoDYXfch3LZFv+emkBFsnTD4cr1pjFWJSNUWzSIsy1QoQR
	 cwKeoFD44aGOV8OOPvRaUmd9eLHy6E4eW172hYKSjCM79+KpSoAEJvqNSTsXIgFQng8oI
	 v760Jy7wt9y4RwdJkKpbGJcXFUK6yO+EeBSPHz7emoigI3fyIDafU811lJMXKWClnug==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+ZXlnZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT9xzYfH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A8EB1F00893
	for <linux-firmware@kernel.org>; Tue,  2 Jun 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+ZXlnZE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT9xzYfH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7A8EB1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527gkGX1638382
	for <linux-firmware@kernel.org>; Tue, 2 Jun 2026 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaZKnmJ+/6YVnHKIJqf9z4v6
	CXPf8LxE9YwKtDn2GLg=; b=e+ZXlnZET/Eu3Aja8xuGdm9/Ii7Ha/I+znYgUTg4
	Wu7EpXD3qMbshAsU9opIB5rX5KE3UjsxGXS3JVUNaa5PXYEQEtMvoyFW6I5zYo+2
	2cqawsEYzctz/q6JSpy/iBy96Xus57+inn8htoBMKd0jmccR01VRsNiii3u0GTRW
	jgajb9wQ9PmCkwGQx3oPDuUNA8bBBFmqByUV4+bCi81QgwSU7XqL1Es+T1v6JNMN
	ddPRw0yyfsEWxvsOEINLIAlmWTMcmRx97GNi4vttCKdyVaOS90wdRLs3463q6EiG
	ho174v1G33WxF5Jejg9/+zH4ERhqR8Vbj1jLIGm1tCB27w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1ch4rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Jun 2026 13:01:33 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6caac6486so2190710a34.0
        for <linux-firmware@kernel.org>; Tue, 02 Jun 2026 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780405293; x=1781010093; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaZKnmJ+/6YVnHKIJqf9z4v6CXPf8LxE9YwKtDn2GLg=;
        b=LT9xzYfHB4+BXieKw9RGHem9ZXxebDxzgFRTSW33eS/NTTiZsGjzG7X/gNiJlbMJVb
         yPXTWEdixlF8L3/S3mRSbUIKB4LjCR3dAt2+Jkn/mJbZPrWUxspdthq/d6oIbwXIFDOv
         4/6p39LosjhnkzX67bcwquuQgnYIniRkO8laQCZ/N+DZZX64qHSMFQ3wfCLHcTt2Kn1P
         21738fOV66GR2+MSEpKVBb4OiqzjGsi/V5NqTuVkVYsNs3xgmjRmxhOJoDkVrakAVcxO
         5ojfwnKK625dpedAK3IuVuKT8QBD3o6ssp7hOyqjoCn1NEb/9eaou0BYs0w3ad5Bbzhy
         5ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405293; x=1781010093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaZKnmJ+/6YVnHKIJqf9z4v6CXPf8LxE9YwKtDn2GLg=;
        b=M5Ao7NBwNTNmiQsyV+7NfCDibUOA4Ns9pT7bz3eadwWXkhpzJc99qdyht4K1PdTD6G
         /HqB+JOKVxG+9eRqkPfhvkSfdFRPj46dKh9BizgZaGdWxOnU+EGkYuOIaVlAbjry8AT6
         6X2GkLeuTzwgOvBioVbSW/bv8k8uP2WF3wmOOc1zWlLDoDB3bnyvL4grJbXPR0zSjwAn
         cEcx/5vQPRdSmugluHSflBPHVUumArksoSv6XS/fjIW7H9IV+s+7BEIBzcEy4VqLuHkR
         JrYGSCV2dwnm96NmcSuM3a7Z+35eaqbeCDNC+AI0gm0y2CUJLYJr5QYdqCkflROVVhM/
         0Ezw==
X-Forwarded-Encrypted: i=1; AFNElJ89Z8aUi7pUjILY9/zwYnu6pZ/sBYRAU8s0vnEvqVCDVhz0C3TVmW7mqJKXwxLrnXR370YYvz9PJ1rglHnZaQ==@kernel.org
X-Gm-Message-State: AOJu0YxstVeYuDxOhqcC8Q+AFyXu8sBL+N5p6LcIZiBrIz5eWFozyz7K
	uP6GQKx29vx3aAjx6ri0BMNSTdWoBcfCO6am7nW+nwuAPTGxWgbLBSpsQOWhL7Jx5UVGwcodFML
	Ai41c2ijpu719vAivVmDr0g9KegJhj/h9iROxY+ceCpvwQeinSD6WgOtJiwYDK6k=
X-Gm-Gg: Acq92OHvjg6KOeGAzTuJJpUFC/asjgqYZoiGs0T//QJvGQ3zuHM0iSTMCaM3Uwlw2l1
	iWlbzgmqEuN8F28EieerpxdMfD33KSAPHLrStuhTrzljspFqim9wDYLwEbB8/SO4qIxUyGQANoN
	OuxQA7kXsaV+ggIjBSny7ON5VHUf5HBmcdQIErqwY5SlnCHnSI10aFSbyFXmNMS+OPyiTi716PM
	MgbPggpv8W3Ebdg7gVf2YEv75v8uWJLl84lZVivQp58vtTm4Ede59EpMqCYkSxW2Z0GhlVi76BO
	ElzPHoRh6z1LonWfPR0g/sRXkvyK2JKuFkyE/UJWRdQ4kAi+MdLEaqh5lX0DSmZnwoCVfK/xYpZ
	MwCnOeGnGkinmuoVDVcI5NzWrCuGyUg1PYEHFvKw2o0nDD3sPh+LtJvOSqjVEIpsEhON3wc0Uu6
	ulvFF+KzRanrZ6lw==
X-Received: by 2002:a05:6830:310c:b0:7e1:f7e9:327e with SMTP id 46e09a7af769-7e6a1e99c53mr10989403a34.22.1780405291208;
        Tue, 02 Jun 2026 06:01:31 -0700 (PDT)
X-Received: by 2002:a05:6830:310c:b0:7e1:f7e9:327e with SMTP id 46e09a7af769-7e6a1e99c53mr10989198a34.22.1780405289544;
        Tue, 02 Jun 2026 06:01:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5c8735cesm2646349e87.19.2026.06.02.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:01:28 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:01:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] linux-firmware: Add RCA firmware files for tas257x
 projects
Message-ID: <qxtzexchvsmvdftntbd6tfw4ydp5qqdox3isuqlscp36uk7guo@lmp3z6riwffj>
References: <20260602091800.6237-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602091800.6237-1-baojun.xu@ti.com>
X-Proofpoint-ORIG-GUID: btueyrzM-oiT3td0WEBJURqrjQEW9FbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEyNCBTYWx0ZWRfXwmrPXHQzH4qH
 E4DdASvC+p51uAiUv2nH+CTyVDFhYdjFilHtXVhiX8WO02H28heAHO9qM6ihbCZfP/cj4E3vLar
 ore3abY8Gjpp3K6ExPpg6wOC9ptxVw+4POZBf3G3td5s32AzUbCupBbhGYmEihmH2Soa8zgSwlK
 WtIENCQjYAXLCZlO2RXgmaK8N5InFowTkJ7jej7HMobkXWDgcVgfFB5LUiFzEd5J34DX3NevlPX
 ZyITUM51WjrKR5Vybu15G+k3t6JIgBEaj3xLI9Uaqj7t8uWkn2kLj/oGEiKTHgAVQBmalsr/rmg
 fx9oqZH2YwV+CDdZrmQLfqTMERGO+QYvzjNWEAXfOdY0yZ2qGkFloViDEs8arrXF+hAjUxRx8Fg
 nclDUSFwALbKL1a08oRJ1po9jscXMmU/SWe+4/hHfF+b5tTOxQXeZblW8bb6fEuZNR/nlsBU7FQ
 2+sS88LaCFF61Dr9eBg==
X-Proofpoint-GUID: btueyrzM-oiT3td0WEBJURqrjQEW9FbF
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1ed42d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=BecvUixRm46hVBx8RukA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020124

On Tue, Jun 02, 2026 at 05:18:00PM +0800, Baojun Xu wrote:
> Add tas257x directory and RCA binaries to ti audio folder

Thanks, merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1074

-- 
With best wishes
Dmitry
