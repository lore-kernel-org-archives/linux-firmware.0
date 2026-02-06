Return-Path: <SRS0=T4hE=AK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC9EB28D4
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Feb 2026 07:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E18F4C16AAE; Fri,  6 Feb 2026 07:25:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEF17C116C6
	for <linux-firmware@kernel.org>; Fri,  6 Feb 2026 07:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEF17C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xcfw695036
	for <linux-firmware@kernel.org>; Fri, 6 Feb 2026 07:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYtQ0dGRv7YbN4jHuKju3SwfISFQPMq9p+YwDtMWJPc=; b=b6vwzLKA8UP2A+NZ
	eDtCWHZOkjIDEARf53WE2tf3/wOVkBaM1ZS7qxIYtQdmS5smKIRXnbjbUni5vVX+
	fgqZ47oysCQhvKhxz06wF7ye/w1bRUoX7BcXCfVU2dXJznxb4P6kuxKLtiQXuCbI
	fB0iMGdvFHZoLJWZAsPWGbRaFjaH9x6Qcld3odJSD321J+xJeUIIUTYcyjF+vcZ+
	7OGDByq9DKpq4+121uwwxs8JeRfbJ9jQySLzE0vvMXjH5r5sLPJ6wdLU9XwPOV4I
	DFXHMpo77fUSwZGLzOg1b53cWqP71NrF/S80jNe201/An/smtRv4oWr57OyhXfhG
	nn7XlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv9gn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 07:25:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71304beb4so428645185a.3
        for <linux-firmware@kernel.org>; Thu, 05 Feb 2026 23:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770362750; x=1770967550; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYtQ0dGRv7YbN4jHuKju3SwfISFQPMq9p+YwDtMWJPc=;
        b=WDRuXi8E/3Hf72/cPmVknm92ssXqP8uEp9HOLhDYdMEWBbl5o7d7SuKsIu80poJlOp
         CYzeahbKk3wN6gxpyC9giKj5OG8Yp1gExKOcGh5OYDgQCidkSRiv1hWEz8HTFekNcN7t
         9isahA59ub3xMRPbnPnESL4jTNVSs7Z3Qlx59BOu+eGFczdKel+bWeAyUtq9VnCh1cir
         Fmx8ngCiPR/h90TRqdxkxuSTgyxpqul5xtowhZrN3iAIm88mkQ4YH+F0JQuqxwQZ9UqU
         fdHx+M2Kyt2p5c9UHBq3tOO9SgqOpBdHfOA3umGVDmJ+Zsoq3TD3CuY8BL2i/90dJXMI
         YIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770362750; x=1770967550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYtQ0dGRv7YbN4jHuKju3SwfISFQPMq9p+YwDtMWJPc=;
        b=RjWaU5P+DO2bG/vQN636fOF8ouACjonLzvzAzSVMPErRxdHMAFrnqbr8HFGsT7ybCu
         cSDnl/VbJdTsdoCWeFH4bLQ5Gf1A+ciVo/Hn2UMqB069H8W2RtdtMmNjQDuzfWWUcopA
         e+CoihMYN1RTwNhO7lj6Xd1Df7zL9qReGlnXHvIsb39FKPrUEzZLu8nbLnv6QBXDcvk9
         EFFLBFwiXW+KEcJgdJjqVCQaKJS9UhES8yhGtqB3YTotLwYXjoX+bOQRpChkx2arip2M
         E6wURylOS6t/xtj2fhNes24YiYEOW5l+vT6hQhHuFs3zkPLsDIi9EdMlEC8itlwMpupo
         YKPQ==
X-Gm-Message-State: AOJu0YzwMr8a2kHPirkeFeLgKZ5cISLE4zciBK+6QUCoETniL5Ne3HLR
	QSfYKjnSU1cqnEUOaA4V1RawU1drMRoOxBt9+W2StUyKaZxYxukUggwMwsSbcoDzcZc3LzUe4t0
	APTclint0AGHbWQ2MC9sn8tTytT5cUvgLSIw+z68uxTvevpVVkKeKFSY7D0oOKLc=
X-Gm-Gg: AZuq6aJ//bqmaz9L0DOC9I6qGgZ4Ngh4zusZe/r9zY0LEZAtK9DL0LEhd1Gygt4PRk0
	u5/AVV/iRv8YzLxumCT9IfD1XdDB7UXLsNXu2k4jTx09P8BtCyBiIScWEOAvzaCnAXIU3VfEIKp
	zOw3PwAK9mIvaQoiqaKAi6/Os1Np9JO4h4Fc5j/+04Oqx4EFbeY/BHiNRI8R7mKiKjOepfUHkns
	KRVELBCwTwJ3B9ofTON5TkDdPjMAaMesxUg8vi+6eTcHW4BkzOJfVeck6SmgQafQM6wzd3dentu
	4iHcHE0SEEXJZdLYoPEAowA3rmpsDHymrQ3nh8kTbg5JIOYtR4woSVyNz8IDjr5+SDr7L5Sd/eS
	NRpfLC2qMQfAnTmBs5ksz6Miu4RvGwH8yE7b/KjIG6x8ax1A7Zwo7/+TwZVuXCduvbuqtPKG1In
	zbseDbUgs0IojSa0zN3LQzsMo=
X-Received: by 2002:a05:620a:1910:b0:8c6:ae3b:e134 with SMTP id af79cd13be357-8caf1ace0e7mr225899685a.90.1770362749806;
        Thu, 05 Feb 2026 23:25:49 -0800 (PST)
X-Received: by 2002:a05:620a:1910:b0:8c6:ae3b:e134 with SMTP id af79cd13be357-8caf1ace0e7mr225897585a.90.1770362749295;
        Thu, 05 Feb 2026 23:25:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d29a2fsm355994e87.46.2026.02.05.23.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:25:47 -0800 (PST)
Date: Fri, 6 Feb 2026 09:25:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: Re: Hamoa Linux-firmware: qupv3fw.elf
Message-ID: <nvpznp2eq4xvnecg4qe7bpbkurgkiqmndoszb3zf7chxsvv3di@ura7rxjwnuvh>
References: <81c5e83b-9f87-4caf-bf2d-6aa65d25921b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81c5e83b-9f87-4caf-bf2d-6aa65d25921b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=6985977e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=c9ylBvxPu0NWIPXWNh0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: QHcmyQRaRGKKv6zwgokopsIs3CFHRPBJ
X-Proofpoint-GUID: QHcmyQRaRGKKv6zwgokopsIs3CFHRPBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA0NiBTYWx0ZWRfXwv8f+J7y3oed
 c+sCaWzLOH6Hdo/Oq+0aSOGfEQ/nrvdW0TMOzSZzbvI2Vo/rOndrvEmVE4pcobJXl4EAYKRx9MT
 PPqMR5BfChP49cOV6AuAy4rfIXIElJRRh7YyakXK9yLE6Wyl/TVaikX/kcqPgjHT7FlKKagPb/9
 cCXZQDD7KqxJZuiw/XqEYwaxU8C2RPpmeRJ/9UeK4ibF2sBM4RC4iJIZVeIMY8JWBE41OKzH8It
 q5VLmbFZhLaugZt+R6VDLcD3h+t7vEjOlq/xHxf4zp/zI8rLb0/YAKOw+xy/l8fNbrwSoOB+jA8
 kYxzcbs9dpDwRO7BzB31x8bhxV9inZViNzj6WetyrWGEc1HS2MwK2pG1EU29fFk9rLxlMTj/zz9
 G0OuJBa+/s69s7MNEs6X2yCbMWZ5FcZ6wO6WBrvjJWgGZlcbC+l5ggdNwm/YsbjYJ7BKai3JNvj
 QQH4ggYrNJFIQz7Frdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060046

On Fri, Feb 06, 2026 at 01:25:51PM +0800, Xueyao An wrote:
> The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2:
> 
> Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)
> 
> are available in the Git repository at:
> 
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-hamoa
> 
> for you to fetch changes up to d8c5dbbfac6dc054552295c13b03a4ffc959539b:
> 
> qcom: add QUPv3 firmware for x1e80100 platform (2026-02-04 13:27:20 +0800)
> 
> ----------------------------------------------------------------
> Xueyao An (1):
>     qcom: add QUPv3 firmware for x1e80100 platform
> 
Thanks! Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/909

-- 
With best wishes
Dmitry
