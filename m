Return-Path: <SRS0=T4hE=AK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D34EE2092
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Feb 2026 12:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 624F7C19421; Fri,  6 Feb 2026 12:11:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58454C116C6
	for <linux-firmware@kernel.org>; Fri,  6 Feb 2026 12:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58454C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616C3qfH3012611
	for <linux-firmware@kernel.org>; Fri, 6 Feb 2026 12:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xk3DSKSOCQpzYVMvQcUxwu04
	OHKWJPL1srPCwbyA5mY=; b=DQTVm6fALkZ6riHRjQlC21eh3yWUab2C13EVSV30
	cqFUiNiDg8nA7ThT306FR3JPP4lBn0WM5i3shHksk7R+ZaUlQbX6RNUI5kaCQwXG
	0WkKUSeZ9JqrrmnrPisMjayYYOqqGE+Td8IESkTVGsmFlqXZzUHDTYdqA2gPRJ4V
	lHtst69X2dHU27N+PQ8rBnVdKFObuiirf0+epKOXJe2V7kv5ZUacnUNLxdvC19Gx
	L3OXcIQr1Tm0ecJqZuoyHTu4FhzMBQse9Z6T7XJFG86fI8+p0L6Btnd1CuMbv1DP
	3FJziH8HW0IdM/rPJmw7QEdyWQ9dn0T6oPBI4PrBQqYDPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c59ukha34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 12:11:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so610691585a.0
        for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770379875; x=1770984675; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk3DSKSOCQpzYVMvQcUxwu04OHKWJPL1srPCwbyA5mY=;
        b=OD6iGDOXK7gfcpyQGtcqCtTpYQTsNtlkrXxyDREsOD4Nu+KGQraPKoAATseGdOgPkJ
         OsI+0QX5Vx0Uk3+cs2BBJHlbbJOpF8dwa5lLIYPQO/yXOyVQjL7qj251MKgRmmQOHcsg
         rf9ZT8ufqVB8Rm9HUvKXnyeLaLUtQXKBoQznV6F1a9vjtGNIc461iTTqnY6BazXC/dZs
         MZ/S+gFq8VzM5LqRtvyn777lD7Ol68XOD2H3SH+rBbPu4fNqyy/3ZFPSFXu0xU3th/xu
         DrDWT5u7D4JcA51WdyfQ1udQTdetOO2dfadzSpxE1LbW5dcpDc+ZJ1VCsQQBK67h1zR6
         f4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379875; x=1770984675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xk3DSKSOCQpzYVMvQcUxwu04OHKWJPL1srPCwbyA5mY=;
        b=pym4vcMRJdIml7MN+kcX6NPRkOFinMvbRaONPo4lsV7DM2Qu6XqKG166oWN3wJzQiT
         +o4deicubgsJW1XZO+Ge19dkiZcrSyQoQBaKU4hc/iVsY1RWilV95tLDgP0j3NR9r2mO
         djyBmyKDRnjjNsIGm5Nkrc+Me4rr+/q8+lw+KIq5ehTDH0dTSHwzCmOat7EVGTD9cdnf
         UREUsI28VVsshG48nMomRbItBiyazddC7mg0c2LiS90187YR6M2oZEZ4iyzDs3uU5Sxf
         kl3wtO9bQOC1sMkR3Hnk50yn0wyXppAp4IdwlbQA55kHa/9ou86L2UuGmWvtZL91AHAS
         xLwg==
X-Gm-Message-State: AOJu0Yy8F4N4VlBeBSj2xR4Xi3PRfheu3fJKNWht1qZ7a1oQKZW/6nNm
	6tGVSyZRNiFgBSDSpNnz0Bm7KH/JjtILLB1Ye+69AOz7c3UbIsaGHdZwteLDTLB+KbbMLYHgcaR
	iFnRh4/Hf+0353gGs2sqXZGQvPyvGkO/vI8S2aWzvgdVzcG05tTEiDGrO+ZesrfE=
X-Gm-Gg: AZuq6aJBecAnHNKtIfC3U78RW59TNyUIng95i75DMONxQBCRwlvJaa3yP7iKGlmR5k0
	Gme0HP9NT7qTu3FMO2Z4pUUUIapsw4t1vnP+NU14DTsbUZrLs8Go+5nuAbajlj4KUue2v/n9oh6
	FMtiw6ukQeCgVgBp/D3JcDGC4Avq+RPm7bByuomiMET4vXTli8rv6yx6NiAntcdfqGi/+9ifTdW
	7ihyhUhd48PKfxYxUp6BPLcv2aujqb7WiJstdP97Yh2D7+DiCiD+RICKGdbzbCUqRC9WhRYuFRk
	ZXwViRNpolAmeTJluB7pE2/jUZidQFer79AThHXE8G+QiYp1UUr/8CFxzSaQKzDZBX/RhVmFwqa
	h+qK3Fnvmitasn5x8ICVVam+fBhfAcpw/06ZVSaEy2BwNfaO08Nuy/DnLFOIgK28lr9CX+WaqIA
	0af81hbB6Mzt5lHgTiaQ4wVx8=
X-Received: by 2002:a05:620a:3949:b0:8b1:be0f:da52 with SMTP id af79cd13be357-8caef4094e3mr317772285a.7.1770379875593;
        Fri, 06 Feb 2026 04:11:15 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8b1:be0f:da52 with SMTP id af79cd13be357-8caef4094e3mr317769885a.7.1770379875168;
        Fri, 06 Feb 2026 04:11:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21b56sm544384e87.75.2026.02.06.04.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:11:14 -0800 (PST)
Date: Fri, 6 Feb 2026 14:11:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: add video firmware for Glymur
Message-ID: <nk77gdeun3f6i7b3fuv4n3h2d6aitrw6fpkynjrd67xwbovrzk@ml3pekhupn5e>
References: <9f708bc6-349b-24ce-0930-2982ed490c88@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f708bc6-349b-24ce-0930-2982ed490c88@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OM0qHCaB c=1 sm=1 tr=0 ts=6985da64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=dUKS4Ft1fPCOiWXm0O8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4NSBTYWx0ZWRfXwPK/6UbHde0c
 FQYnUrUAGTr+NiE3jTo/BFjjFq4oWXMs+5GTuOV7cuSP1UNkgm/Fj+t8UHg9SkKv+7dcIo69i5C
 8iWOvISY7pN6HdjAq2xrrDkbXB/7tHspbsF/UJWfER+WiS4EUy3JDrBpafVxofrKz0AU5Efowxa
 ygIeV2zDwT3MORRAPwUF4Z9D3DgLOeMrV6mZ2FavoK0/4jcBukQZubggagy9b7NXu3erkOdPgxW
 tPviKWAoGlTf7Im2DGcccNCEF/OQDTBBAKGtt3tFjYv2s0YVdNZSR4bSyCVcBlUDmbv6XLnTix6
 EQouYs/NxWe010U7oZ2THNj4MrgMFatq5ZVYfmaAvGFTOxKGCtz1qfD4AYTAOFEo5HBjTo7IAse
 K/lyPZ+8w3CqYtIHLMwKJgLZuqR7k3KHvDrF9LHsm8E9mn08Up4wXnfJ8FE+WINXBheR1A1BpyI
 yShPESG2EbZvhlGnqrA==
X-Proofpoint-ORIG-GUID: zhwh8ccGoHB_o-xaRRninbgy8klJzdPt
X-Proofpoint-GUID: zhwh8ccGoHB_o-xaRRninbgy8klJzdPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060085

On Fri, Feb 06, 2026 at 03:39:48PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
> 
>   Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-glymur
> 
> for you to fetch changes up to 2bb21553d510073cff360555692643a3cba24d11:
> 
>   qcom: vpu: add video firmware for Glymur (2026-02-06 15:35:34 +0530)

Thanks! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/910

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add video firmware for Glymur
> 
>  WHENCE                   |   4 ++++
>  qcom/vpu/vpu36_p4_s7.mbn | Bin 0 -> 2503368 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu36_p4_s7.mbn
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
