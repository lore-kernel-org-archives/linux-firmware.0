Return-Path: <SRS0=CvfH=ES=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893ACDB46B
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 08:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A063A1F00A3A; Mon, 22 Jun 2026 08:33:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782117195;
	b=XVk98YZ5pZnD6ueFGb5qvDxTqEt3/E/IwybVmw4PCIfKDv6gE68yNI1kj72CJhtryTRg
	 b8KCU2a4rUImKIYg/aWSCB/9U9641P+ZfCxgsapvDOERM+of+diIjcE91MeLchED/Jtme
	 qPvUhbX1LoconSPVjMc8WR23JF2KkTfNCsn8RpnGiG253Fsxv98MxIUTsvbxRmiK/vVMT
	 tKoTqYWv9y8u89uDoxuxhjVjq1m37U2cd/lYZwl9q0JFu4Is7BUKmoUyif7QqLAJll1MT
	 8ZZnAex19bp2/NId7rZD8/br5dtMLkDyB36bsV/dmn57r4srg6Q3E+2zvs97geiu9mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782117195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1FbXpk53QtgokqVdP5NmlxYhKtt72S2AiciOkLvdT/I=;
	b=DSp2+anC9ORNfhz8sQiIKTKg0ElIsUNh/vZi/+ZkYsZJ46Vf6I/SS0WSZ5f/53vlkRdp
	 XS/R0O4BgOuYSXxxWegQcDwDkss7iUMX6kpYHI5UdbjIbO+PrQg0Puahoul/qnOpN6Twm
	 HD3HSbWr7SxCtBzZoM585ZZ3F2b4V9N5f/NCJSKOXYb3syfMdN5WQvU/fxu/sQDqfIeVl
	 bVNFPpo8hm98ulcSxvRgwvAN0CehVgJn15pGRoajhjJ7ou00VL00tj6v86gAH/AC9Jqxh
	 wDyMKjM35udeWE8t6k2Y1KJtKQLPPjXhCctMzq1j2gwnKOQDkKsSiUret8M5LoVbA9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHKjeUrP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WR7LetGk;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 068821F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHKjeUrP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WR7LetGk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 068821F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59lh93881125
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 08:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1FbXpk53QtgokqVdP5NmlxYh
	Ktt72S2AiciOkLvdT/I=; b=SHKjeUrPwYcxuPZVEYP6v6xjm9rRe0kONtxMeVO6
	BCaQeniP8uM4zIV/DHl4sLg1BQlX27Cdvw7swGQ7FRG6eyRGP9vMXtxbN/a6Mx8R
	x4P9xV81gOjECz3dwPvwPoJtnlVMjYoAY4f8X4Fyu0J5XDwTuhCUhf8DVS3em9oP
	oTR+KZmuMFEiFuPXpgquQpfu5nBK/KzgwdAOMqXNv8yUCPjvSTLrFcSLWSh+Pn2Y
	MuAS5xjdwPcMepSliBVR32glwoOxjeAjT7k9NW0jWX08hfMNqHZfFZB+9geD7TDp
	OMmeNtbDVlLO0DGomT7oxAV4J2upCuZPLSJraGzdU6JVOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjedtv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 08:33:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-923c6c59f63so183708685a.1
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117193; x=1782721993; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FbXpk53QtgokqVdP5NmlxYhKtt72S2AiciOkLvdT/I=;
        b=WR7LetGk1bo0wsSUvJbRilvDxk46cb4usJs7M71s8SStpvPEXt6ohjxr2Mre3g47CX
         xSo8QW6GAGf/Jqm+N9GUvdnfCVSsTwOrqx38oCNrHwox/uf01FYvcMIHggvirGo5ysAo
         HlvEEkW1UB+ORA777bnUA578NDpcMoYNkRRw4Uhm85d6USNiYTOFUBPMHuwusMWPCbrc
         PMiGH3TxA7078Jb1g42yadMiKhlQ0xIWyZyC7SLY4exDBvhJwqdGJdRRsXSYrzWss9P7
         5ap1VH7Qoe7SdWs7NHyLaaZRVmGiBL0GKZ0zSEwkugZ/8TJ7QGKIm5hcHBzVTOEbXovE
         Lr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117193; x=1782721993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FbXpk53QtgokqVdP5NmlxYhKtt72S2AiciOkLvdT/I=;
        b=eh5kUlUtllLVVETIbR9x5O7OeXcak7f/HjeMOgOp6INklpSvEIWFNrETRDiXnf6gyw
         Y4/yNOhvjPAfJhFRl1W/ZnaCBS2xfQPcj4wRmSHhBuROqwnFyz+ve6ZADl6/O1B2/7+m
         cF/bM0+0kHDbkyzjV9jKRA/zmrz2VQhSqtE1nz81yDKZ8Whp6buHZYhXVL5sWzluxbWk
         o504rE1AqN0HUixJBlpgXv/dkRquSoz1IxOO3WcKu2MoigXMF6HJavZRVRPWNOf+eC3/
         JKu8KHkk7OqcaAjdkEFbQAfRjP0ovSckvNWG2LO0ndX1fudYqKxJDmWpuyd+j+J/CznA
         PkBw==
X-Gm-Message-State: AOJu0YxVoXPb87C+GShKgFCZbECzduztup3N6aTb2kg8bE92QsvlIFJ6
	4rLtjruQ9JN37HMCTFnY4xkvE1N3XVDQMOQdnYI6wKSGATBNMUUDCCGY2RShM/+nixh5X5KAS/3
	DxrLFTLmHSVdkJL9SP1fplNVB6oLOKZqaTmKcwuxgFQ798dQbTdSAQypAd16gWIUT7eKHdn8=
X-Gm-Gg: AfdE7cmyaWeDB9lphmI2sasO53vv5wVIRgsE9wV6/e415jSgHhd3rfGpEnDEzg1iF3H
	Lw5oS3VExOhWu7BKXllKxcOI/LQ41H32DsFYBQq2upA/yTJz1YLEXt17inG7z0ZgwvVn/eX5JWX
	BStoNauxm/XGMRdudW0+8Ba8PyVUvOtjrZAzisJzU4kFmn+7cG1m2EHbn7kNNuGYzEK2hsj2gdj
	TQz7rbxhlM7irI9+hQmSWCbkKKbiCFiw3475g5MAbo+fwPMGGdheWmHkndWsyWQewNkv8tYQqj0
	pIjGq/qJpshF+9exv+2hcWGlE47RxYi3/vaXjmf6v/aOJjxQCMoht94lrhh42xCFXCl86YqisLx
	aTu9X1yd8EInNlQSxgs92nZYrWta2i1mAuyf3MIFXZu6fK++EXoEdUdRudBm3UY0aJRbg/VHpuX
	PL14YSglbygznRDtdsF6u5MlOn
X-Received: by 2002:a05:620a:84c6:b0:914:c0e8:224 with SMTP id af79cd13be357-92092d3ae2cmr2173027785a.54.1782117192862;
        Mon, 22 Jun 2026 01:33:12 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:914:c0e8:224 with SMTP id af79cd13be357-92092d3ae2cmr2173025485a.54.1782117192350;
        Mon, 22 Jun 2026 01:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156f02sm17047681fa.21.2026.06.22.01.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:33:09 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add LPAICP firmware for shikra platform
Message-ID: <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UlEaaEYC9Q6VABdXcMfBHMX4lVjMSvPG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX441voattkkDZ
 51RfMvh7G7q+SR0QSRCPhDVCfjCU52SUKZuPVjyLDeXIiXehsMAlKrwrbOk7VouvVyNnN75HN6M
 +zAWhFfjAJcwpjW5cCp43yGcK7e6hGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX2B9OuPPskQTh
 Z8HGgv7/pKIeID3dnwZyVsxqxBQqW7ZLBUI/PuXTk0fvfCKokpiq0B7dVYssCrRmFTrWQfNDosd
 1oouzO3GI6Ku+WlpUmH3/bmU02P9D05PHIiBm6I+9EmoB0T97akqfEQNw/gUMWv249t+lawZglN
 f1Ol1Aid+Bk0V74TABJAVq8kZJbzu/w/83ufXKlRDMbT3yrxokug92Zj0pbCerHy61ocSt60k7I
 N3v1ExEig1ZnVNxRS7EgaADJMklMpRlPNvSQyPHw/a97SkLZUAwSSrrwyyjE09z/cFzY0znG0Ec
 g2QXXrxKEd+sTB79K5ObNWeJ+rv5Dp8NmKA61u2Yj8xu0gI6kjQNRgFsYQY0+JTJ+jLdvDYyE+O
 NoPdIuCaE1FFdXjL4QrPxkh6Aci7GcBFzvDD0zB+00mQ+Wv0/k/6FBNroXejSRZyw0Tn0pHKxc+
 VMQm7T+HDc+528dtnjQ==
X-Proofpoint-GUID: UlEaaEYC9Q6VABdXcMfBHMX4lVjMSvPG
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a38f349 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=qC_FGOx9AAAA:8
 a=VJWxIXImpyIdDLu6Jk0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083

On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> 
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)

This is the same and old commit.

> The source branch is 36 commits behind the target branch

And GL refuses to rebase it because of the conflicts.

> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> riscvfw-qli-shikra
> 
> for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
> 
>   qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)

-- 
With best wishes
Dmitry
