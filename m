Return-Path: <SRS0=qOYC=EW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7264EC43458
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jun 2026 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E9071F00A3A; Fri, 26 Jun 2026 20:22:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782505359;
	b=PjAkeb9hNAhmL+Pu0u1sosewu5audKHKbLg3j4Gxl1naNFXrY4is5ODA/YoPJDORWbF3
	 jjBKO8ldkx7/kHaf6GrEGgyQcU5Ts3s0QaXYOn0CCSLBaSnxMO71PMF/0Wucay4XP8W9m
	 yZuYK9QtmrNyozASWqq6d4tBX8btDPDDIR7nxICseDcdCqCCiGK4wQS4iOQI76NPejlRW
	 nNfqsaNV8tKpp1pRa6Qd3IzkBHUqkL+tsu5pbJnThyjiA34cAfKiGPBR07u0hefwHPkJG
	 htM0GtzmcA/KqN4Ur3p92xcphUTXxgcJbtlJH8YJGph550EhgfDB4n1mUnG6+jNagTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782505359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qLWywYBST+T3+jid+tcrldqjpBXOV0YRTa38Jr01niY=;
	b=SLuHSBsEpvJo9CAoLIyGD6FBoyNV6eB7zWBrPDGErqYIPDKj6v1/wM7a7j59qpbhJ9LM
	 n2S5LlkrxBsPQWztxYQi8qv1Kbdo1A+Syd1jcKXN2y4OKnE8pT5CU0oqDW4yqUvaSKbQH
	 ylnWqotQgKXQt04XnmFAQPSEvygKf0Gm77Icb6qPH8kOCqpJmuCkLJWL2c4fLD8R30qYw
	 Jbj5I9dv+NdA/4zJxBri4uKSsfRO3z+FYGrWWv+ibgcocEYyIfewI9E2HNSpZXRM0rXyb
	 F+g2CK3GQ2X5kpM/dsmS0Vajs1UuA8We8VRHSXLVO1KDGUVBL0SxJnqgbuNYQg722mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SxBsBPtP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9FWICuo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CE431F000E9
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 20:22:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SxBsBPtP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9FWICuo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7CE431F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8PFG1729623
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 20:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qLWywYBST+T3+jid+tcrldqj
	pBXOV0YRTa38Jr01niY=; b=SxBsBPtPYD54oVd0T4ImCSoPcTeGQ/D9TdQTliPZ
	XmihXezwRPjajw56ZHUvhfb6DbOYsctvfQH4quhPPqHraOnpNSla7+G8bjB8RUzk
	yzZgzHQV1O5IhHFS1gtPRZzBy/kEtlKD6LpCHKPVqZj/WI6NxcRsqfDQ4cLJMpLj
	q2VzWDvNAjamBIVV3NBE364vlosJI0q0m5IujOCUubPGnPi4ldpZOyo9iap1kfzU
	HhQBAK6bQKFdjmvatfD4PbZ1yGgsQUjqscr+/NpAbs0nU0pRmII00TnbrWgsBXGh
	EYPPW4NBpPdwKKWkeAHotbPakfXt/drFixi98nBK8quOnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qskhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 20:22:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92af3d5e85aso164372285a.0
        for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782505357; x=1783110157; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLWywYBST+T3+jid+tcrldqjpBXOV0YRTa38Jr01niY=;
        b=V9FWICuouTeVw/xED9EBNx5dspeTUPMuUD6RIS64NiswgiGyAvyEor+wVgmcwwo+gA
         mzi96cpO+yUIeq8AOXUNJGtZMwGcFZmwwMNWTRnox28jeMKW7yXuvaJ9nI7w3N2eP4ds
         XMqVcXMVcQqQWEcTbFmI0UeyPAt7zUGeuz7gZ94Jn7t+YF39YF1IAcOgWFBdLqPpwFMB
         rUx8qYYTbPOGzkiOovkJb5eXHHLyLOV4gFvRmh8NbMBbetFBKIPPrNtZZrEQeZcZZG54
         JRPK3/LIoakRzo9tnXYOPfbn5aCFdVxMgyUX5C+srgCa3RF6rHq+CiHeanCFwyS1tj6t
         UCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505357; x=1783110157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLWywYBST+T3+jid+tcrldqjpBXOV0YRTa38Jr01niY=;
        b=VtgJr5/fdBm5JH14Bv3jTwkiZGrol+zCZcossPEmWOdD04Y/wBQLIHtY2/d3SYuTWi
         q0ZfbaSfPX9wQnuZ+3kwQMhHw4igTLl+sJjT1ER2Y4xlmJD4/lycZ2Z8UxG7XYsPgn25
         0QXeSP0ZlO1bmtczEpihb70MMK0+2+M8qRwA7OpEwj+38uzTmOewCT9J7tG5YJTR7/vZ
         N0izN7sR8beaB2ouM1wcY6vmQ4+EVzGlAEjtrcCzUNTjVzjaDiCviA1W+JcNz2t0cXPc
         3T82Y/eGC9a3KaGD5nDkoZPigJ+w/HplucVbuD4O0sIiqB2ocywvsHzsqKdXEdw+1vub
         sa8A==
X-Gm-Message-State: AOJu0YzhK6VY4LfGXtzRD1NDXj7UFZ9JoRPe6vK+J6OiwRC0Wdl/P8Ul
	ntK9/aa5+trdqsePsXOSZAYyxGEkjwDH0jk6rUClU8RsC1tvYDt2EQkuvaiyN2v//B7r+Coftgf
	31vLuhIbeVNUaTKsyBTdTd1tj0Rf+u/fyYDDEtAwviXHSf+yqcmaCP78TRTTACbOxcHATioA=
X-Gm-Gg: AfdE7cmAFjT0ixE1e9sEgcG2mLg6l00EtrWsv6TRdKZyQ0i/qjay4XS53vP+OhTqfZl
	CRGy3IUvfhCXBgj2nxDAsQC/yec5qj8a22b9pGH/MlyFTK/YLPvAcqbbuyi2lSTE4d4MDBIv/A/
	SH/Av/B/VQqYb8ThrbpztktMGZrsAYR13xuU0fFsgdlzepbwUNJ8SbosIMIRZWHNjDxxLwy5TWA
	Q7e83HFC4PWI7Ek46K/QImq/XvODWK5hCarK5bSr9Z5w2fzVP8U/d51B34AkvIQMSFAIfuDASNO
	OK8Fml/OEEfvC40Vh8PVhl1BsjHWz7c7AH7sQoaLgYTPKKpkyO8nIWiqBCxO8iaryZ5iXU354GQ
	qFoMPUkGEESe+Q92pt84sLGbdOfW4HlfM6RMmLq0LLGlHw25nyHe26sP8ABFuPTAfkOitxWn4du
	/erTEVmgdFW8RQ148uab08d5Wm
X-Received: by 2002:a05:620a:e1a:b0:92b:6805:91bd with SMTP id af79cd13be357-92b68059642mr173432785a.69.1782505356491;
        Fri, 26 Jun 2026 13:22:36 -0700 (PDT)
X-Received: by 2002:a05:620a:e1a:b0:92b:6805:91bd with SMTP id af79cd13be357-92b68059642mr173429285a.69.1782505355995;
        Fri, 26 Jun 2026 13:22:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a55bsm3738706e87.6.2026.06.26.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:22:34 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:22:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <uppnuvd6qxtusromxs3yk4e2bl3fe3s2ab2umtusz2nnmfzs6h@ov5sltjdczld>
References: <CO1PR02MB85698F560E017D2B9DAD0B31F9EB2@CO1PR02MB8569.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR02MB85698F560E017D2B9DAD0B31F9EB2@CO1PR02MB8569.namprd02.prod.outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2OCBTYWx0ZWRfX0q9ZQ31YYXrV
 BPl2BuagvQ3BhIQcPK12LXEdz/da/DZfPfvJTybfr1rgOjef13pVfgcvdwqdyrHPNcHzxyDwUFQ
 RAIpU2d48/CnnQIT1goM5p+Yqibb1C8=
X-Proofpoint-GUID: qqzR0fEMpsG_SMm5Ugvk_VeaOl8bqn8B
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3edf8d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=0CK-9qBmv_uUkERuBSUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: qqzR0fEMpsG_SMm5Ugvk_VeaOl8bqn8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2OCBTYWx0ZWRfX/RQRls+blj/n
 YPxYOE35Ks7WgbeW1l+dil1RKYdnKxFwO6HbOba2bbrVV2MPFQmKDdvgTYjjWO9u3XGqO5/6jyb
 jWp0wnl1HjMxU+dHz0XQWmryq9loGvfwXUTTAgitOQ92zhxD7XgJhHEJs4kz4zP/PRsh+3rUMYi
 cPC67q3SZXPo12D6GGmbKFIzId++tnnzyRxLVf87nmj+nV5rIRphFSa7tpBwUxrQngD0DDTd49B
 p+pNB4+Rn8MgCyasozTIDOdIin4pJ7ZzvECHdtNBAoR63jCXWVgOk6KDasont9dAYZnUYYrM82D
 nmHn9HRT+7gqtPIRI6oY1rfEJYeHAjKkxZ7LiqTctpjtQjleBmAGXMnhegNlNOx4v7fWk5yd/gC
 Bczv9S2gev3d8lwOe89yWSG3LbpP94nr1yV7xYkHKgd92DzTQ8e1n9E0elByN9O0VpVS8+LwtAR
 pOHqsbkXDo5q3EUtaNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260168

On Fri, Jun 26, 2026 at 05:23:50PM +0000, Srikanth Katakam wrote:
> The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:
>  
>   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53:01 +0000)
>  
> are available in the git repository at:
>  
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git* modem-fw-shikra6
>  
> for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:
>  
>   qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52 +0530)

This is still being ignored by the robot (as was the previous one).

Josh, Mario, do you know why?

Srikanth, could you please check, what is wrong / different? I see that
you are still sending the MRs from the outlook. Could you please switch
to Gmail or to any other, normal^W friendly email provider?

-- 
With best wishes
Dmitry
