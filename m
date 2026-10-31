Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B2606A31A
	for <linux-firmware@archiver.kernel.org>; Sat, 31 Oct 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTkTHF8u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tw5HTMAD
Received: by smtp.kernel.org (Postfix)
	id F02E21F00919; Sat, 31 Oct 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793478876;
	b=o4nN+sdBQtacxsHIW155dkeOt8JUxQzTCoa5RG+zy9u3LW54w1QWC4RaXGd+h7b0Ma6j
	 SLfOtz0I008vPykkVM2WgR2R+V+O9ZLj3XPAWEFLftYMzL7j0pdxsNAr5v7ZmIr/w5abx
	 O8YpQjjI6gMVn4n0DOeiEacUrzPVHYj2GRpCVWjhCGdcYNaDMWIKNQu6OmBQxHRHCdJ3E
	 6MK9dRipV8bZNZ4ZNExRucvYDn+0yNx+O8G42ghwDqcCtmgecHj9KRV1gLFkJ0p7i+Nls
	 vNbclNoR4NCCJpZ9O/RxuF8Vw4E19505zOelXJ/FomzBXQPjrVij4hag0jjOdnCVKGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793478876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/gcJtRQphwjLyuLORMb/qVOndThn4GVYUdCrAhATV8M=;
	b=R0tXakitGJpAHiYU+gB6qunVBycJc6gxbHzFaJpk0RGUIDXuz9Ba22x/YT98I46Pfahz
	 szOTieIcF31547FdU6mVYcUrz3hQ5hyK7VDumqXhplTKW9orXvFHrHdvYD8NAVeGh0itu
	 xb3Km4QF68DBfJGUnTxmuPF2V4/ZdR7IcOiVQYqISEdf969NmReW1IgSHDxOf6snrbD3N
	 J84Itvxg9AoNnGrFCrEt4H5v7yRBdAwpMgVUoZjX2lWAdjvb+JCEAQv0/xzZaqDGn1VOz
	 /1qc4Eqx7vetLC0MB9/92BeZoU5wnzkvR17OQnUhUrzf6s6WzcJjhTscOcesLVmDW+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTkTHF8u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tw5HTMAD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D01A1F000C1
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTkTHF8u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tw5HTMAD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5D01A1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF1dW3976267
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/gcJtRQphwjLyuLORMb/qVOn
	dThn4GVYUdCrAhATV8M=; b=YTkTHF8uKYjW2CRFCdXLaxJVigFFN5jPyZCleGLg
	U94LfWiGHYSYgHwwlrxVZE+CItjo7UTHmKOlA+Uxt364QBernQ48riIvvSSiCS1W
	cOoN0x4YX3+d/y0DDPBd9Kra84P2OCSoiocnORcCBmZUlNblg1e1JfWKSZusqU6c
	M+7PREDQJAfGmVQ0f6T70DwfNUyPNvdQ7q4G9SeVodYPO3H7RYOHh8I6aVkR/+D/
	D87Ufijnr2g87Pj/1n0EGxhQSInjQA7bWgEXeVG4ajjBdjNVwr3f5uw7mRSUNp/6
	RLhdGF+p3cflJXJcReDuDlsF83cAhfsy5HYyWN0yE48qmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rt505-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so491526385a.1
        for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478874; x=1794083674; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gcJtRQphwjLyuLORMb/qVOndThn4GVYUdCrAhATV8M=;
        b=Tw5HTMAD0AlSjaNExA3q27chA4xf0MCNZ4H78eTBaMQXvS0C70VCuVIJbK2QlDP3Iz
         6HtTHlX5t0C58LoYrjXWmJA1ppINUznYBe3Ey/ANvhrCKT68DHGTTP02xmBxMFsLlHdE
         2wcQO+whkgmaZ1jEy26B7pQTeYFGpyeEM1mQINLglJPcSzQMbPbUK1j60aGwVUR+Kc/B
         l9O4W5gTzmgOE5KKMMetrRIdVrOIWNlKrVmP+wRYwHY+ukG6Wre/wxZJj/5VCiXUgKfk
         6Jj6RCjMxOk4HgjLg7iinlTquXp1PRR2F3FEFaqRl1RBEDGGhwwIWNH9blrYK76NE/Z9
         32Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478874; x=1794083674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gcJtRQphwjLyuLORMb/qVOndThn4GVYUdCrAhATV8M=;
        b=MKtxazvvkuEDLF+/eg1PgsQ5Yn6e6sfqKGM0d1ElV6gEWYB7o343JXye4GvlSSb9Lg
         CpOqOyUttJENu+j9bEsKMqMRCq+7u7wjvFcV1yldrFbC6WG9qDpLnzgobrORetY9vyt/
         HnCPn+BO5GJ/p1ePbjrYzT1TI2bFcJl9zuLWcIiYOJ8HTvxHvyG72zdE/r+Qd3kFz99o
         9M2kstKAGA3SHP1P93ytsWcp5SBFrhFGIkYSOdZnZqafjmwfsCyHe66HCM3+qHfdFNpG
         sDHDivV9X2MMd2nIF3AUQqlkhTbghuMp1ue3yIpM5CSegZaXT0zHMvxNfG+gTg25MVTT
         1NzA==
X-Gm-Message-State: AFq9FYKGdxQXIWzjf1raTe7IEueNnnok1U37Z3um4Bd11SSuY2WBYGKV
	+e3MJ5e36NjRJz94J8E8TLYMsI4fX9/uGQH1A2PMF+pRXQeRM+nyH474RGN6Xyc6XhCN5iacCuZ
	qc9RGIc6UbAGvfZ9yiFBloMxJXv29FPUkd8fEagRGbcLZijtntoxJ1MbH3zvA1hQwheWfdHQ=
X-Gm-Gg: AYBFou0YOlhGkjL8+Gea6BL/xWqd2I7lls/3q8c3ky/ZzenSGROFmyFfiLFWZRXU6ll
	oQaaW2zmbV+/+6COFXLv2C1Hdo+Wx5tOHcLfY6fi5kYS1I0JhbQMuW17bpA/LdvcoA7xsOG4oPb
	iDN7rIo29bCDiNqpGMn4BaGqGoypR342HaORoA4dHAUcRBtDeBOY1rSD3roYZmgFV+zLFcthl9w
	cKkOBOivrUS2Ojc7vxjIegvWD3Ou3KkiLD2n3GA+955P24kEzEVDyQ0XrY7EQCw08xKZkxXZ7mt
	Z2yYnceOKTx+pyaFtF3rV9EVZKQAxnO8Mfa1KkVio4reNx1e805H/3VHpKO4PTuLC+MIWZelKwJ
	TX4blpkCFbvkhMy0PBBUd9WWpSWpPBfjHfPB5GkSxaIia9o39vMqcAz1dzYJ5p2ZMTkNtKMdOc9
	P+lIPUJKFhkdhMi9SIWLb7QrmM38xJyACGyERSqH8xNmrJVvCAmSbUpc0wNwLWtw==
X-Received: by 2002:a05:620a:404c:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-94421725362mr1019122785a.65.1793478874354;
        Sat, 31 Oct 2026 13:34:34 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-94421725362mr1019121085a.65.1793478873914;
        Sat, 31 Oct 2026 13:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d1a8sm745508e87.32.2026.10.31.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:34:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:34:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update LPAICP firmware for shikra platform
Message-ID: <of33fkjakvawol77wvth2z4xlut2txnkjr3iybks2or2dxmglj@4g7fw3izonya>
References: <b9c4aa6e-8fe2-49a2-a63f-c4c3e6844a27@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9c4aa6e-8fe2-49a2-a63f-c4c3e6844a27@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BW8Ruoyn8A1vOUOLWAEXlCMPuUzrSt2y
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae650db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=0jiroXdF-jMsPfUkcBYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX6yzuYUAVK0EF
 bwW7O0gdpc9ZIbfNfhJWvnUXx3nT5iU27u/E6edXyv4fza990XzxgMylOTi0PBcfuq/shhyPXmQ
 IKQxx/xK28ii3yQ3UctDwP4h9psAMDA=
X-Proofpoint-GUID: BW8Ruoyn8A1vOUOLWAEXlCMPuUzrSt2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX1Ll8BLfuEzJr
 VJoruPLfHZLXrMzo6gZK++vkqIhi06rNrvYWrWCL7o44yPrsR1krRUe5qUvQV15wL4DUL7wUaov
 Qlr/qZDGoDrSwx2AUnTnBdZ8cJ1Qh6IJrWHhYWrDzz8JzqClHwewShwubT4+TX7dG5wBYDkFtS4
 gpNc+LP6VXPz7z7UkbreTS+wfBlDFxUltCnzkA/L+eah1xRll61h0+bSrltz9NKJg4yRCAnN6GS
 KTt0Ly7Ym/ZA9eCkV6ZcTK4ZDmlyAtIr17lG5QZhBFGjKQkZLAB36N8wPimRLyFhpqUWxnvEoTe
 PlFCTkIw/3k1LjGZOdogFloNvC/OSTuMYYjtx0v8a2GWVlY1WgtwRh7G/+yvYlr4nRPgzoF0Yol
 rczMDiQGuY/Njl31/NyU5QlCry86hJt/oZBErqIJoezTQ/H6kzA7wFeI4UtROYAOT+wAPvJdFgJ
 Dj45switZUAoWDaW2Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 02:59:55PM +0530, Venkata Kota wrote:
> The following changes since commit 33af2bf0c14509fca10a2fd53fecd6282484a6f0:
> 
>   Merge branch 'robot/patch-0-1793325085' into 'main' (2026-10-30 01:54:47
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> lmcu-fw-qli-shikra
> 
> for you to fetch changes up to d150d0c1aad6c8846a6967ff485d8c3184baf799:
> 
>   qcom: update LPAICP firmware for shikra platform (2026-10-30 14:56:51
> +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1330

-- 
With best wishes
Dmitry
