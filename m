Return-Path: <SRS0=XpAG=HE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A6C79FB6
	for <linux-firmware@archiver.kernel.org>; Sat, 12 Sep 2026 12:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28BED1F00899; Sat, 12 Sep 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789216369;
	b=JhIZTMftSQeUZKsC1vJVEaQduIfsrbraHzk1AOMfXER9LqEuV3zT9ib8HO2ffD1vISsp
	 Ga9Bq6V1/oM+zeeLZhBQ1AFSOHyjeWF7WJk2xbXXGdcTBnSRVIqwocMd7STbaq/8Rsi+L
	 mLEi237Fjvsc/qYmHT8cqfNVOit0wPTgHMiFQNYCyivu2xwjENki2fj3H6EQ1BEhwrusk
	 rlHsg8BKW+0GE/tm6ym4sVkDX+N3TB8wbku2hOf74fcAAcXY7a6E8X3LuJkQqskFuu8o5
	 3sA2DNWRGI6FE37B8x0IJJnqYy1D36+LRjCThd8w8nLUYX+BLB50koXTdW9Q6XTGX4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789216369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
	b=bRTsEXeP0Ov/Gm2Jf2RYJWIB/cbjHemgcImIuZYvugIv9ATF1TXh85YTDMaND0lwY4/f
	 HN4KItjkqzQN+gKtshTrLA0qBs8JUh4eJvahAe4uVnIVdrT8LiDXFhKblljsGP7dMJq5P
	 0fCP0kZAMWPOU2qM4RxORLOMhFll4/4gDCYYhBwrCUZIXZO6XZAEbd/iD4QCinU8p7DqO
	 lSx5J+eFjV3+yP2VzNjP6S38BBlSGm2JX8ybDJkwtJ3WRpO793Ta8a4SSs4oeS5oU+2cF
	 C6mRDprvziiwZfwykvUcRrT5LplV5s8CxTiUsEYOYV7MmqV8DAEAv+BtQI6rWDnUfrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+PC6Egr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hgk1pZQt;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8055D1F00893
	for <linux-firmware@kernel.org>; Sat, 12 Sep 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+PC6Egr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hgk1pZQt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8055D1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBe1Rg2210059
	for <linux-firmware@kernel.org>; Sat, 12 Sep 2026 12:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcgdAk8cNLto2WtclY2UGYFI
	DFDob1kxiwZg+puCrSc=; b=F+PC6EgrUXIvrub8LFoqBiF5YzmN1QXuT7rQP3tk
	ZA0uwmesH0s/X/ZsQi9P84xajxiBBklR4qDf9QDwjMQJAt4uMqFzzOnrfDhy1iwq
	81eXGIbmjIzHJh80sYY0mRAlRfjL4jS9k0WwQpgM5opYI9pfhuN3L3tMK5VfL985
	iA3K0bUFMGeslRGe/F3VC2k74v3IHobU5rrtYl6Ml8LzbQTiCbFcmAp2LyA8ciKc
	0aaqxvm/wnq7gf9JcBI2xMM276H3dS5mxmsids9ukF9qKwUm9ijABp+Yo576GrM6
	I7Ddq/gi+1ztTLFPvlhDTqIEubdEbIK8ykPJ9bUpWfKfgQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018gubh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 12 Sep 2026 12:32:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso1327072241.0
        for <linux-firmware@kernel.org>; Sat, 12 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789216366; x=1789821166; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=Hgk1pZQt+Ij3ZQmTSBdjHHTsAhG2XO8bdd6U4a8/anV2h1OuWx5kUxB9NlXUdC6w7I
         gRCdhDuy3i6vmLxEPvsGbgI88LV5OYG9bz3KLKTRgXIewGqWLKFFMJTwsqr6ZFO82MxN
         DpJUFgBUw9zHaawIA6aiif+LVOdTvY++Lyzuc4EhpYUPV1J0lnA9lGf5v/x9dJJGQZjM
         Ide6b/2AaWh+Io1Lxdfj8RVM7JQpgEPShz/GkPau7CodoXRR3yp+GRQuPKNdxLHKuF75
         N6qSxn2To97eUBe5HSZKrGtmFfYqHH7JdUe2CfuzRnLJ1RVtOpfmbqW0u6mUGSx5uiTv
         8O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216366; x=1789821166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=dxDRiHSBJ74cYdPuI4tCeT8WIEi+eE20nh5hHxnTSch9IopKKM67vvfmZRZ+tcEbUH
         MTM5X+DQ6z7KcJPedsOWJ2JIqaTG7vBnDV4CvlwG0UIYA08lPWztqNo4YTVPzYa7bYg1
         q53lvH6taL+5xtc/rxA8JJ+ZT5a2i7bfOjQ8c4RSmTvBQPQbqGmjA1jD93H3WNj5ChHF
         7zoM8I7Svvi7YOGcIySGfF5ywmcEDL34TK44zBOcHiQxxnt7LUzsgyhY0xMHVyywI495
         /8vaRmDntXKNhUaDpHr5kXhPUf0YuAuZVNFCpol6w2/5q38jVT1IxW8Ztasxy7lBq7/Q
         +DVg==
X-Gm-Message-State: AFuF++nG+L5aZGqR1mGgKT3qUZV09KjfEE1RYvgOF4ieewYac+/i2kk4
	MtTDRtCUJTNfIMbZZeYwnQQYl4YYaA2Pjuz36RiFtGp3JP+Ol3Z7z+eMbNKrFoCuCfGASMeP0e1
	JhzpG4l9XQKqERj0dSDM6qBaPeIjK5TuAONyvXaL5xULwy2ancRE8fFE5f9mR+KM=
X-Gm-Gg: AYBFou3U+CIgrkdtaGwi7olTIah4m4nLwXFnj5FIkrHUXR6RENLUOG3kHqG2yGoYhNy
	C3UZcZe/LyT7JQUc90oyqPgmA3xew4NVsr0l9VHNZVLnp0p28n9z28sOqxeiWcTJ5w7gA5EXhp0
	/OH+NLpf+EzNsEdaZhKxqxQzuZ1ffagiLAnwZqTJnkiP65x40JFTeGuyFVuAH3M2gIdROY3vJf5
	umB2Isqv68qdiWpV6+ybPxPXDcUfBj1Dpf3VqYSCYedDLVi5gbYxoXuldOQTPhj2IKgUGejEw8D
	17pPaBdWP51gmZCFcBXCbKJHSJbfoef8n57Ajlyy+ZfjbxQi0//DUc20iZ0cfXcissUo6uULBJn
	F7z8x0y7MbCk/GeMoi0jVRnkpl4DP6AYaJnCKY38TPTQB3vGXTVldKEvYAdCCuuqfqssq+QIi77
	IF0p+1pfFEzhYD
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504276137.6.1789216366542;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504270137.6.1789216366126;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047a643sm1202626e87.70.2026.09.12.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:32:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260909
Message-ID: <n2imuih2huckb2r6weqfydj3pygw235egmmsm2ug7gqc7ud7on@jwh66v3csydn>
References: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa5466f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX+ry16hIGg51S
 3E/2H5aC+3BVeqmjQGKEbVVTcdVZrS6I/i9Q9KM4kS0BI2WTo/bxdO5xVGxrBD4KQ6uVcmbLk3B
 heSOGQ3gFasa4WyjsP0/Vh7yfyC3Zrc=
X-Proofpoint-GUID: A-RgsLW_llmQKOvHbr87DXmDDM9o-v0J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX+loLtl8pNuye
 MEZSqcY8/fWCVjOtT6Il0lfqvCvpIKxEeM68Yo0vcNaRbeBaEShb1iKITvGOKaMfIYqK7WyVRLl
 3MjiBmP9yjSLxrG+jyADPQOBatpaA7xV/FujnEdIqUUo0f+thxGcx/UQCW27pi3S95hRtvaBFPq
 TqhUWsCNpRqegOZURfQzyT1l0uSD1+z1Xs6nhJjNmOTyCJQJxEdvYi4rxMrVvwEVXgoTnPps+Vr
 9dxpbO5v5BRBiB0LJT9j408Ysyc4R0xBp2LDAoAok6lmiHhGJkGZRBfMaLQbZomRa5ZQPpykapv
 vb8T0/KtzqWbsFGacNYtbd7mxWTa6Ia5JZh7Olc+cQT3KXzGI5ZFqukjOzN8Xivw3p1i1AU66EM
 fY/CMiNi287PfVVEDuhy4LKgZEQ9v0d4wOm2x67YCGhEdE0EiaHpabSAnnqJeboJ8p1pFvLg7i3
 nU3vCZEw2p1m5kAMBqQ==
X-Proofpoint-ORIG-GUID: A-RgsLW_llmQKOvHbr87DXmDDM9o-v0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120180

On Fri, Sep 11, 2026 at 03:13:14PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k add firmware files for the shikra platform using WCN3990.
> 
> Please let me know if there are any problems.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1238


-- 
With best wishes
Dmitry
