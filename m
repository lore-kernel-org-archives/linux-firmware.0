Return-Path: <SRS0=par6=EO=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8525CD98ED
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jun 2026 11:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EA1D1F00A3A; Thu, 18 Jun 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781782129;
	b=owpDaOOK/JZxgn8r8i81qdQ3wyDM7JxlN6ZloEUrS0sXr/OKQSnzTow6NmMVTxs8qyE9
	 mJ/v0mZ1BP+QAzpRGf9rpKvJJ+MY8SE2T4CJhsrgGy0xsugrWV5O1EsfiKrRWa7dEL9jW
	 7FX6zv20HHc+iP/mJ7NO/yFrHIznCa7uzqP6i6sassXepQKf7F0OOPh/gncVpaUwqxw+q
	 Tcgcf4k9Vkm+nLMQwNKboZkDojLgemWckkIJhlp/DpC8/G/V3Oc2L+uHyT/bbD7WLG8HQ
	 JGNUcK1ydetoj8R7WEmtutgmba1JwHwYKqwnwayFVbuYu3Lg3jOoS+xfDQd1IXKKJ6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781782129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/8CA5SkfWtok3XGk24Ual7f/kGyHAvG+2LDr4F9R+6U=;
	b=KrF6lFtSPtx0LzNAHSnC8T8RbmkKRDH+ee+7QuWcO+RAApa87E91GdVBSdujGZ3ZiF6F
	 Lv+m7nKkLjlRFjZu9+NJZWUyp9x6uwsxhYzKIMYdhD/9BpQtqYL9CrOmdslRLqyMeE9EN
	 ugkIT7+WJMuDFCaiNEUsmsjxuC3SaiyFjAbe/hJz2fdmP4/o5VDThK7OvmuP0Eo6UVQjo
	 NTd6Lb6NdgnCXfuVvyzSVT5/Z5IeHO2ZowXkIpNQBsix0opQmg8zPkbJrjNQJEXMZxBB/
	 PcWjD+78J/lSrFFJsNosOOKHvjELE7elHfU3kPRyjyD/07qPz4jHaaTY5rjKFH5xgkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1agaO4Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdnV6gcb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39BA1F000E9
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1agaO4Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdnV6gcb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C39BA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArvor1536510
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8CA5SkfWtok3XGk24Ual7f/
	kGyHAvG+2LDr4F9R+6U=; b=k1agaO4Y7F/UO9IghtoBJvCXnSU5L3FLsHOPMy2a
	ZGTpDeNHqwbyRFuHtqhadkJcRQd+h+0mg3lS1KvReQe7KTEsoM5xXdCJj1GOZKSC
	mC5QPhR4DjaX2Ju0khw0E/4x4Mvgqz9hdCNphaFjRBvOxx+dX5F/mERn2or1vDy4
	fsAGtu+8KIhLZmm2TKBddYMoukg4BPmMoM+VRAoCQUhCVele9UYGGXrUj0f3OB4k
	zU5TfexEQXV4yTsemBwiMgY7zitQTmC6LrXp3JC2S+LxfWiTboAgmuaAkUUuxV3t
	hW5Z+B/RIp8chqm2rs/hQMjzgafHSbR8VYdoKH3wjoYVJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kk776-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:28:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156cb14b1cso145300885a.1
        for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782127; x=1782386927; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8CA5SkfWtok3XGk24Ual7f/kGyHAvG+2LDr4F9R+6U=;
        b=LdnV6gcbsd7SlZpMiTNUDo2TGEuDDqju24WIaaQow0siDVgRQjfHa/AM/whbJhuvni
         QP/v91PXYtJW0+wd7uy17r4uC4Jov983zkWszN10sR8LIZOlw7DQuKYrX7t5OtGbuaOq
         8Wkgk/chwYquzJ1f5PZ332zGl7YZVHywUfNly1wa+4zjDGEIQBQMQRPUedXEBL3V3QaV
         Fbf8w7RU+kCo0oMXM7P1rs4/I+aDCyiGHxuO6gRTTqudvm+d3L1Qj3xDwtxg2bipV4yw
         6cPvRt/A0eL1oX4Z7R0JaP5+R5l5MbSxK1m8yMrVY5cH19EotE6h+dZQjlRBMA+1twf0
         muLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782127; x=1782386927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8CA5SkfWtok3XGk24Ual7f/kGyHAvG+2LDr4F9R+6U=;
        b=BIJF6Ssgmv8LXg6j+BW1A7qMTEWiBb4MyRlzsquIJotBJ2y312wbO8HsTXVjYO/8qB
         FeVlgOguep6736YP4n0YoNOz5v1G5ZgeUJJA4eQxA8uck1bHR2iIKrliYCtExBuUeNs6
         rxDdkN5PCkfIPAScKl4UcuiyucMy8x7wWPpKN+TW8A7cduJmS8d39ak7FMkqJkITgJeT
         I2EjvnMh6Epccmh/4EzNlykMsgX5Wuxa8HEOswNAbgkxYQJB1UCbY+ec9jwCaYJrbftr
         8OqFmso7pbF9Th2kE4qDE197nE45TU36CDCkIpYrgL1+gvlzn/UZ2L9W9fS24KItOiQp
         xikQ==
X-Gm-Message-State: AOJu0YwOBvtJ/if/DVMe07rjO8ZkXbGmH/WNST57wq7CWWReGdra5oCS
	LFepfqbQAUOT6OBv0pb9ODahMJ8iHnB/oR05Haw1zc2xmkzqoQkQpqoHU3HPBfvaIMZCeVNmmTM
	6PcD4iRPBtXnP2z58iL8SQNnkn3Ah7C2bUG6sbJ6BjT+wepu8cnxwKCy7NJj/PhM=
X-Gm-Gg: Acq92OHZAb4FJFG+sr4nnt+QcklBO8wlIz4uIeb90OU10KQ10XmFZOu2lgwR4DNMH1c
	xuh0fLc7IPKwhJdGMqZDMQqr+UUFtMhQbe8vrwwPF04jsnA/x77DrFdeAiIAtvbhgtBVaRS35Vh
	8xWDHy4sUYarZFQ56yrh6QhtGe2xhMDVNfCBtofWAJzmihd5D3tUw7IrwUv+IHKeBYrSl3AWJhQ
	ZksXOQcd0qRlBa9wlLl8jBx4W8SMUtGs31vhlRAa9LU7NuntBC7VcrJudZ4QJ8nCB09CDOxTtCG
	//0yljL+RTx45LvhNbTgpX2KpOJ5DlFu98iyLMukIIVlgBV5QSFoubMymuch8ceRDJEqSEp1di1
	Eeg/uy3yFWO7OcNyLTyp/xYZPQVFEIWHWqC9fxO9srDCtuMQ0lggp9qx7YhQg3eRENYFeINik9N
	Y+jNnXQB/3EryqfDSc4JU51pzO
X-Received: by 2002:a05:620a:28d4:b0:915:bf79:3e09 with SMTP id af79cd13be357-91f28d710edmr527681685a.44.1781782126938;
        Thu, 18 Jun 2026 04:28:46 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:915:bf79:3e09 with SMTP id af79cd13be357-91f28d710edmr527675985a.44.1781782126408;
        Thu, 18 Jun 2026 04:28:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f52sm5269544e87.6.2026.06.18.04.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:28:45 -0700 (PDT)
Date: Thu, 18 Jun 2026 14:28:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>
Subject: Re: qcom: Add qdsp6sw firmware for shikra platform
Message-ID: <zbanceyye3qypg6ipr6qcymknvektdmvc4cjuc553voau3b7jw@alnik7yh2m5a>
References: <CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32@CO1PR02MB8569.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32@CO1PR02MB8569.namprd02.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX8wBTmRIcBi81
 pnE6G2MHfMKcbodE8R/WGhrsEEpWvd8EK+yFylHBkTjxZgDW27eFa5e2W2M7m/dtEpZGSzItY/o
 j+YmB4O1m5RO3Ol3CYL8OZjzI6pHbvRUMNH7auDAR4gGrBbVUQ0CaUB70Dzsr0hcawgSs/LSnnd
 /peZqOX72nQd81iGColILrxrZXNo8o8T5d7AHq1rPNfMM+qCyjqH+P0UifRNA0Ilf7Gi3E5t7wA
 EZkswALiyyesfMfxlt+xksLi2bkaPF2o8aGFSC8lT1m+qZOh8ww08LxH+24R000TRod/K5cRSo7
 5TCjrb2fMm2XTYJQWgrb4eFncgDBxD7Mj58w2mHejgC/mCVOQIy3uTPmw5K8uBdM0etS+26UOxb
 mQUSOAbZLOXR0d3lUGYfeSOHVESsipPEUTXPzbkg+wYowJHeAiE5e6GubPfRShD88uU66eKgYLu
 b7Fn6KHaRl4/VcWGw0A==
X-Proofpoint-GUID: CnM7cbxaEdFNCeHhpTQQR4Y97hrt0AWZ
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33d66f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=Y4uhZeecWctDzimSl3IA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: CnM7cbxaEdFNCeHhpTQQR4Y97hrt0AWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX+Z1fO4sVNvTF
 ZN9AeVgqGn8p7Sp3/qWyaQ36nxUWNNA33o+bTI4K93LGzN1MMgyOGOlo9UmcMF4uEq1mf0WVTh8
 I3MH/tDso7tx19zZl1qDSBCGCooYgWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180107

On Thu, Jun 18, 2026 at 11:07:47AM +0000, Srikanth Katakam wrote:
> 
> 
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> 
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +0000)
> 
> are available in the git repository at:
> 
>   CodeLinaro / linux-kernel / linux-firmware * GitLab<https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git> modem-fw-shikra3
> 
> for you to fetch changes up to 82532137f255131a68aedcc93dbf07011b47a5d1:
> 
>   qcom: Add qdsp6sw firmware for shikra platform (2026-06-18 16:28:43 +0530)
> 
> ----------------------------------------------------------------
> Srikanth Katakam (1):
>       qcom: Add qdsp6sw firmware for shikra platform

Please fix your environment, you don't need Gerrit tags. Then please
update the commit message to drop it from the commit message (and repost
the pull request).

> 
> WHENCE                      |   2 ++
> qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
> 2 files changed, 2 insertions(+)
> create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn
> 

-- 
With best wishes
Dmitry
