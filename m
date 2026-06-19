Return-Path: <SRS0=KWmO=EP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7429CCD98F2
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 14:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E5ED1F00A3D; Fri, 19 Jun 2026 14:06:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781877972;
	b=mtx0/Xg+Elh2hQ+ipTcKif9bBmTWUSNPadxTg1cVCyt7s18WjtPO9dv0YDH/Szx9QaBJ
	 KY+QJGLnQ0LtTLvE/oSr1a2ybbaNiHmmj8eKwH8ClD0OX72NwvIpjjhNxBbhaCkCEqgeI
	 C7XnBU76cm+ZM58lnVj5kvRHE+yu9yOhs14ckcPn9D6TddI3adVS05YBHMWUQR6qjY4Uy
	 Gu2snp+10PCcyAd6LoPUc6tBGiZY8qGEuqqPG7XasqiAZBbKviZ2P+6P4CuoyyQ5+KBEo
	 bCadB75jyXa1ZNqV+OgvCa3M04uVgDq/qGvMybiXAoswuI9T8frmDu5JukhFcuu9I4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781877972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x14da/BMGS8GHcKsyfxc1EY6YLIpd9H7EBoafEKT0Kc=;
	b=JqkChyfYjELUNmTkrdfx1x7p8InpvsmclmgMi5I1XsAdoP7zZhRIhlW9uG/s2JD3NjNZ
	 45UrOSQuLWe2KHlyjLo2xXE+L0Tppu1W9HpJ8qkftfftpZM/dyOczu/iASEh2FhzEDt6t
	 ghWPT3zoO/4nsiCrRgt6Tg2uk7gpePiFfW6vZ8TFCG2ispG5g6P7zDOV66jwp8AYHoGjs
	 jlsSOv3/qLNFLxJr9EEDKI03kUnyraDxfOIyyh5OtarhMXUQ3mbtTQoJe+D9dRrjedOCY
	 ZbU80gQMM2BwK3BBSicTOzpWpIM0DjFoJ8fpOLvSzVa/dEv9w3G9vs2rmilxJVQpDYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTJYf2Nx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdsLSeyd;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D39A1F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTJYf2Nx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdsLSeyd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9D39A1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDCGOJ746257
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x14da/BMGS8GHcKsyfxc1EY6
	YLIpd9H7EBoafEKT0Kc=; b=PTJYf2NxLmqJ4Fu8VsHfB+JmPa5sf2ibgaIm2I81
	mz7di3veQoYlDcgffqx1V85c9SsdxxS85dp92cxWJqfXFmvelOWvO6fuZtrothBI
	eHnz7GgXwT7ARk4Fa77bR2YVwyiKInToUrPz5gFDYYl4EIQbc8rJWy8uvPW3sFdi
	ZJ1W3s65VL5oOVhOk94Vp2PmCsSezrcFg7A4ZQPlwzQqE2LtBKB/Qz8AcAgHUAth
	MiYW3suo9f48KNowdj5AM9qeYWHY1/EwdIcMlC0/kjKNdO4ZVpGuaGrAMKVdF9qE
	uJ3RZy6RcZU6+bYqMcilIKUJlKB4ik7QLQwSmu/CVXCfcw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbhsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:06:10 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e92ff90c55so1018842a34.1
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781877970; x=1782482770; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x14da/BMGS8GHcKsyfxc1EY6YLIpd9H7EBoafEKT0Kc=;
        b=OdsLSeydR7eOsyRlmqeFcTVZ49c3k99iFkt9ySketxW8eSWZgY6j4ykZE5BehEZGSw
         Beh8+YXCELdYYs/9k4jUfJSWeU2JJHdxQYzAtCEdQfWx8g63iY77x03yTtGRLoz+Xb6v
         NPzMhhTP2dS57jBp2p2UC+7QrXjDMiUEuhZqQJr1ROXcFhBFr1/0+f39cmOwUVin93GE
         EZLC1OUzVs+i6ViQ3sVV3E7P+wodXirFJYFPKB8PgISVxcuq9aYhP/S8GeNhppIap9GS
         LC5Il/++jLXjchOc6/zSbCiyacLvFRs6hlQ3AD2VpfV3DF+6tpfavB7Xs9GIs2eOS72d
         OIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877970; x=1782482770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x14da/BMGS8GHcKsyfxc1EY6YLIpd9H7EBoafEKT0Kc=;
        b=Aj9TQ5/VhqABypeb84iBXjH4EdUYLaRFQOMy6u370RX7fDDUwgyW/euuMkBOe63SMS
         BAtXQHIRTnaaVP7nq6MuyI/DcBVqNiYfm0ZRe7ZqIwlcfDm5pOdZEs6warKOAXwFxafO
         SCwBZgW4adaR4fuUy6QTawjoWCbz/6QJbiXu8NInUDgNtTb3urDvdqok/MAYdU4P1w/w
         t5uwhMZMpAVsQ2DWQ3e+tmZDh09b9zDH12fMJyWJuPZmYoIvLjCUdJzY051lD9iuRp+z
         kkXSEkcLbZF0VZbBSi985SpoZIzbj6dpa0T+tHnZbQs4HVQ3Skf5Pp8FonrRWRvPXA/4
         opKA==
X-Gm-Message-State: AOJu0YyQ9E6RylEL3W56+On1UhNDYlMhUAJsKQadRSoLxjRGf6bqm+GJ
	oh1v0Mf9+gzFj+XLzkz7ZZop4M26W+k76fFh6os+IZccoduPYt6R3NrD0md5NVHtpXc+jR+1eNU
	gMwU3epG+mb+m0XRr89D41gbMPevwznvXlhC2JDGX225Ddezx+Gu005fgQGpkrdI=
X-Gm-Gg: AfdE7clx2nJL9w91Gfl7/vFKXBCbAHQbi9gfON+AyggzKACJyNYsBKEZJq2K1BFkci1
	azmOXkI70ImugRdlMkY/6HlkN3U+aXB3mBuPY6ap9Shw1Jv2kCAdUBnk03UHD+0pXd23Ymqy178
	F7cc0EeDkTIZkhPSl/jE/hiOAeqfclrpcCyZ19lg5OONV8Lz3aGP6J4T28D6T4tl1oTA7MH616g
	mf3qFO2861+mGmIFhbmd8FHdKgWxyhhSsCBnpCDAkEhkiaghlNSh0PkcGDBfETL4SsLq1OWJjxf
	7HDmIk9IQ2Op/w8Wfo7k4nONzBvnEztjXljLMbLExWwJztgL/q5vonBfI0byMtsVtvsXsklDLqv
	z0/IZXxxSwFcPNDhRMBzlm8KlkroXpnDhZqqO5saSIl0qR9gSn1/yRSpyTanlAge9JJNabt+A+f
	2OP440OZ05GbaGYRXqK6wkLo+i
X-Received: by 2002:a05:6830:6aa8:b0:7e6:6f9f:7455 with SMTP id 46e09a7af769-7e92d5a0b92mr2944769a34.10.1781877969776;
        Fri, 19 Jun 2026 07:06:09 -0700 (PDT)
X-Received: by 2002:a05:6830:6aa8:b0:7e6:6f9f:7455 with SMTP id 46e09a7af769-7e92d5a0b92mr2944729a34.10.1781877969340;
        Fri, 19 Jun 2026 07:06:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad574a3037sm600571e87.83.2026.06.19.07.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:06:07 -0700 (PDT)
Date: Fri, 19 Jun 2026 17:06:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Sankar Reddy Poli <psankar@qti.qualcomm.com>
Subject: Re: qcom: Add qdsp6sw firmware for shikra platform
Message-ID: <m7ro73osjb7rzb2c25pf7sj4wc4bmq36r6yh3f7mhtiqyoyu4z@3y6ubt67snqx>
References: <CO1PR02MB8569E09510530CE9F5ADFCB4F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR02MB8569E09510530CE9F5ADFCB4F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
X-Proofpoint-GUID: -PTs6hR9hMfvP_WeE1a-QJ_btnnSKoLL
X-Proofpoint-ORIG-GUID: -PTs6hR9hMfvP_WeE1a-QJ_btnnSKoLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzMyBTYWx0ZWRfX3zT0Z1Nz6fKn
 q70afLAyZHQ2RGnIuvPA+JMkh1/StB7rvslD9mvNs01qfmCkUo/OF/WMcdyyir2pKB/WBKvBu8d
 Z5eMzi1CvzTQNaJI9646cJz68SQTsZ8/tojYbPnjgyvfi/Neyp1+bMQ9Vmy2wjOBDIq/k1kMGpm
 MogvOR1iJuKAf8Vv+6k89H8AvTfXHyxjo7uUmS96unUoWf38VMjm+wFo29LdtFc9wZw3/6x4m6v
 MKvjNImUHenQim2AiH8v9CtnXq14p6FD+BL3sWNbtBGcBjm2gEL9ez3DRyUpp3JdarPKzBkBM62
 CwlKiwyTeOfyF1TyNBQIMoIURbMWNVOWNMtBCuf+DZVQ3ZkWIlbAp1g7KZ8Bp1m3W1R4JsCr0WG
 rHvVq46AODEGAZdFM2YXVAczY9xCkVIaRjjuGieWB/CA/4TuGmLw76b8xODEjOrEbDCLEDHcfyj
 mpUJKXZW6WUtNjYiCCg==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a354cd2 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=4mNNdHAvU4mmSWDByiQA:9
 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzMyBTYWx0ZWRfXzkGDh0lVtd59
 2MOefmcgTCKn43Mn8aCTyauXE9Mgyin9Nrjb5q4hgvPmpERE/GR4h1IjKt4M4aCIarC1Zu1UvkA
 FlmOzBjXlEgwKo+MJc5QmKAOYRLcJNg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190133

On Fri, Jun 19, 2026 at 12:17:19PM +0000, Srikanth Katakam wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>  
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +0000)
>  
> are available in the git repository at:
>  
>   CodeLinaro / linux-kernel / linux-firmware * GitLab modem-fw-shikra5

Which URL is this? Srikanth, do you read your emails before sending?

I was wondering, why this is being not picked up by the robot, but now I
can see. It doesn't know where to pick up the firmware (for the
reference, neither do I).

> for you to fetch changes up to e5851e6ff573e78d5b0a5cceeff076efca8d46a2:
>  
>   qcom: Add qdsp6sw firmware for shikra platform (2026-06-19 09:48:10 +0530)
>  
> ----------------------------------------------------------------
> Srikanth Katakam (1):
>       qcom: Add qdsp6sw firmware for shikra platform
>  
> WHENCE                      |   2 ++
> qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
> 2 files changed, 2 insertions(+)
> create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn

-- 
With best wishes
Dmitry
