Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73C606A325
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Oct 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOocl2VY
Received: by smtp.kernel.org (Postfix)
	id C95331F031E0; Thu, 22 Oct 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792696017;
	b=lkIVukuTgTYXNOogjy5p6fBVvBJjldtuam+trjAaSxjaWrYVh6WbFGiiidCWIT3FoFpO
	 3UITiFOkqTnDAUPIKn71VY5QzCCSnAwByxQBGJupbizNpAG844uQqXdPoyw+KGJpf1qz0
	 EfFExxnVpSQ3WsgwMa/yKRrzNLUk1zsO0r0OXed1rOT6nIhxEIl/3IITOREBlMUNeXpL0
	 gMaXtq2l99n1hgZ/uF+46QxEwd2bSROsTTBjVndSi7VcQynl5Ledu3LeuY8vhRfgLF4lw
	 AnjEYqPHn+TTaWrseODNHXQCtkzf40jURRcdVKSEV5nmHX8tdrUAM16sSZoUmbA0NTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792696017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
	b=eNTOl97fVRr5D7cjarpUtV/ewYWhsu1AvTorSMuwXm2AjJKzhBpRixClpra8/SMI6/02
	 IfMcx0WlA+OvBKIT/03d/j7IpQH02GqLtmHMSzzrqDb5Bf70aXxr8X3j9NUvy2a71mAT7
	 MRBh830/v9x+BSng2fopO0uuBBF6o04xiRf53ONeEDv15nEPAhhm1lbpZ8J/T57B2ZMmK
	 T/ke9/z8RrwOojTHwPgDyUFQOL9rWXNlk3v1krPpPj8UaGvtL9kbaLY7YitYmItvTRkqY
	 5At35Qv4g/9jU0leYXfQVQlh9qWQoLKiqPF6t78fp2g0BO/OFuUNkRxuaVDawiSkPuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOocl2VY;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1CF11F01825
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 19:06:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoNqwJo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOocl2VY
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C1CF11F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtVtp387692
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 19:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP1RCtA53459OEDtUvLHcE9m
	HWBQjuh3IU+rXf+WXSk=; b=BIoNqwJo+9cHw/AmG/yoh2Nuki7TD+lTLAXEY8DU
	yqVhor774k3lFGuWtN2mJZkBFd1iDm09qQlX3EFldoIGWgUvY7vBvCXtLil2PWn5
	Wjk5LYrhD+59pwSlKUNqRz5FF1UPTbLZuYJVEL7RrZjPEisHOZW8TY2ems8ZxAVc
	Z9YkyY7YQxybQG1DUqAViNSM9Nb8dUMid2Z5p3LSKZmMZ+/cqqLkXEdcKvYl+kcf
	egrlF4OqlYtMf0XUl2CkZ6aSmMG8Tz5/iKLjn5ZXm2/7mxwn0cznuuWJDkeQy1sT
	Pj55wKPqvU432hIrIXn9ZZj+onlLGXmXzUT+mQd/PM2EYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq475u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 19:06:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso17812385a.3
        for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792696015; x=1793300815; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=AOocl2VYqR6tOX7WVcZ0TCoaVm7P1erCHbtoODunTZT7gQ75uaNoePOyH1deE9cBW8
         TXesLYcaZlq0T9SFI4VDOt5caIw9Ut0j2GXrL0DmAwqA1CT9Eb4EJfu1qF7Izz6Udv6F
         GwjNdTduuJFivYlCmNEfewxqs3Oh7traZPOKqF0k8jTUzEAFjp2VSgPvuh6F5zFZNKRo
         17pE8sZf/frrgmTSE2GhTvxHhHHbXsqp6Vi+DfT9RjsKHxuRgvmFDuFqpAPPgWnlJgSC
         JgzuBj17gB3Ue8bgWNhyv4SV0ftImvADlkBbvvCOlmLSsqWhL45Hwo8G/QwrvWT8DwIg
         3COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696015; x=1793300815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP1RCtA53459OEDtUvLHcE9mHWBQjuh3IU+rXf+WXSk=;
        b=m/gnN+r6yZ0Xe+BPPxwjIHur+IyhScDBLebiuxeF5REFkIG+QdZONMFtN/VSTzzdc3
         fw7KBmNXxo89lh9LPuciR7/7jem5LfLRuXl1DIktsLC2eFt/791DPv8J8FRr98O7dkCZ
         62b77doqRnh08RYk3s02EIa/0v6bHeRWLQtue90DJGNP4EMZVYgpeSVtcPJn7eVNs9Ho
         7LZ4OjB9O8jJFfhZBQUa45wwxbi7ctYqRUKV/Lt0dwgvVT0gZttw2Vg2DLOs80Pha2Gr
         T+vEw0FZDs++3Ic11Z0zoe8QCJDu4YYw1DpwaJ47Az7Gd8GRyCLfWS6Wd2Xh+WEmWU9U
         HRLg==
X-Gm-Message-State: AFq9FYLEx4uVHKv7rkvyhhr9wJrtcLLiGfdYMdwbdkYBzNESkAIQ17Nx
	GQxuirPKpPNkDAzXFrdS9J0kzFeKpacQg6+m9Wk+DMMPYPaSenC71Up/oW+RW9CHlCygwypJCtr
	LSAEvhthDbrUvZN/DBslb1lBb33piJV182rOjog608YaUOuYfyQEqz8uU7Z/7JkY=
X-Gm-Gg: AYBFou1ISDCXLt4uvTHY0+RvikdpOy8HOLr3+C7CqXs9f/z7eTRXMvUbEJ1MTEucqto
	4+pis2CMoPUSZg0Z1ASPB8XMxGtbQSlUlByJA0fG34/UdoNVf2wSoeY3GC30DKEK/K5ldr7CR33
	/FegKLwoyDI8U8TStcvSQrLhgOTqklJTBoZj4+mP0oNIF8RrQ5hwK8z+H6dNVdPKBen/SXSPUxz
	Cg3cfWaxs31zdal8ZhD8jJ7SSm6DNa7I7Z4+V7tq69BAR71vJn5fkLkoeaVQI1vp46va7IIzgYq
	pvxzWo2L2W7HXYE4peGP6PHYirMSQGLzVi4tHQkXWs1N8/sVTTCE5j/BeQBueUtQtC+86liHO/m
	g80hQBo1z9/M1XgytjwyU1yKJI7l4wT/8eKjINf7ZVQKluWc7BQJcSFfPaBK5+pXQPQavys35TX
	yDQru4dfuxqApN
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64323885a.39.1792696014949;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr64317785a.39.1792696014437;
        Thu, 22 Oct 2026 12:06:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a31acsm14215e87.81.2026.10.22.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:06:53 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261022
Message-ID: <vicvgdgj3hc72mj7q2bp6mdskwajufdexr3gz63v2ixrmua36b@ojvj3wo2j4q4>
References: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
X-Proofpoint-GUID: JTg1NXAj2vcCzN9rJ_ipdBlpJCkuz3kP
X-Proofpoint-ORIG-GUID: JTg1NXAj2vcCzN9rJ_ipdBlpJCkuz3kP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfXzfaVvFVbxeBk
 zDbs4/nFHgjhMaMVJwXlbUOwtcr/DtZnHpqH8g0Cm9qgP+cbMR9ZQ/s9lnW7keKTmN6otEb7AJ4
 pUwj8ZPHm3TtkQh3lSw8irN1UN7n5Ls=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada5ecf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=u3i0YCyx4Cyti68HAGEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX6lcoblZ2TDyU
 P6St+HMgH8bbQv1jc/SEqV08qFuu7PQTK7ZXGeyVNc2fhkw1/CzJmfVdSV3B+hVfrD6vPtJomgJ
 FMLdZvyq3HYI1IjyXKqg0VfjmUMmf+mVo6jEmC6maP3NWzt2pG2mrcYd4VH7ofR+KVhm7L31SJ6
 +O3oE3ut94shEtMPYx0pDse85MAIL1aNy2ARv2jqMIAkPM9OqDOgX83fleGRkpD2K+ULEwmv6Ep
 zcx8ZZuBIlYyx2juHnfWUs2HDFT8IeCHxfbr9plxvZG5qZrF7vX8IXXu2Ddb/LD8mG+Gd918oy4
 duSP4AmS79pDBgQ7S/lDvsAhTP8+Yk9rLPae10zWyyVMQgGp0znRk0iSM9e0s+6fWt8aAGcmRWJ
 di0Xogvr8z/yK9lmZn+0jQQ3KojMmRxrVrQzdQC8MRVeFP7Lyush+bxEaWVtQNpETGyWld7IeYv
 BOkQdJJy1Ks7ghfM4IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:50:15AM -0700, Jeff Johnson wrote:
> Hi,
> Here's an updated pull request for ath10k, ath11k and ath12k firmware.
> This supersedes the request for ath-20261021.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1319


-- 
With best wishes
Dmitry
