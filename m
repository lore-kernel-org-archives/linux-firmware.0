Return-Path: <SRS0=LsjS=H5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC24CA5FF1
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 11:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EF3E1F0089C; Wed,  7 Oct 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791374278;
	b=DkSqrEywKDuxtwtsn9vNZKnu8Sz9Sxwot2H8/3ItnwnclQVXVLdfdP4QmSSuBVfNEP1O
	 WezOwDuHu2rMcWytFVW1xxmMQNebBAYkbrt6djtBX7/h6Iv0CYLgx3ONY1nofdkoBFrPc
	 2jG8q4a/AcIZ1URZLkESxw+xLZDNg07/FVZXFIwn82l0Apuu0yuEW5jE4c/qYSkahibBO
	 4PIjWeQ4X6B1b7Hv4yMjmd4+ps28D0qPGN1MPDnQlDdhybR2nDfipbpoOmE2h7ZdHN6YA
	 SMTJWBg8HHkALhSA+6Ey2XFRooApyZlqfmyg96tsJjpjaR6tCTj1AWNUQ5kJllPLfMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791374278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6+vIXiX/mjRU+YsaJ8VH/9fgBHMd1MfqMWX0vbIJVT0=;
	b=DaQYf3nhwW0eKXQmn7vbMW0uE9372IRtPNLo8k1ERf45Y10d1jmuX/d68+cXM8jOKM8W
	 3UZ1gJJkLJfKMjzKJM4bGVTuQiRsJhYLLGs9kE0iwkRtg6xMCgAgkzxJKdCJSKC+X74ai
	 gWOQZylwFpe6Gg1RGe/bZ4hkx0fQVXmVMgbFetEqJW67ir+rAxCB66+VfBlGdBGUIHfxG
	 RHUPohe22ExdH3XxXgdjAVy/tD6s6O8XgBImkaFG74husxHI7Mfhvc1gQ3+3s0grqovsN
	 xO6/y23Q5QcZjvbgb4B8tqSiZ0FBOJ1g4ZH8y8kQ1hrpvcvgNtKE8BQMPhh4E4I697A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCoRa3cK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vfx3rxEK;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F25571F0089B
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 11:57:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCoRa3cK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vfx3rxEK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F25571F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVNkt2364098
	for <linux-firmware@kernel.org>; Wed, 7 Oct 2026 11:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6+vIXiX/mjRU+YsaJ8VH/9fg
	BHMd1MfqMWX0vbIJVT0=; b=TCoRa3cKrvQ4AkpJ1x1vT+HaLFiWiNo5D+xk5ebK
	eXFshSmA8j0T8MNqD9yVfDCJWfpZ7Dy2X64ZwU3kvSCA9uW1kDHDvUCTy27Smjno
	DYyHZD/TOW13OtuLmWHsfAQ1LWXPFwIXmjX65mjdgOWhcNERVbw6lekn2HZ+KLZP
	ClSn84oFkikQUHgRd2wrw/osdW5nLLcNOsf5o3jTbPU55qLhqkR6pUbbwJWxhsqA
	ZotP2999NlQMQDXpLSFKg1JQjH7khfrjDdjLlu3EeO0KYv6tGNjQ/fxOdJ8rb7zp
	daoxizyV4KaEQiCY6grj2q8ZRBSNum2BiBw5abhJr9VD8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8s7mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 11:57:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98c46da4b04so3016188241.0
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791374276; x=1791979076; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+vIXiX/mjRU+YsaJ8VH/9fgBHMd1MfqMWX0vbIJVT0=;
        b=Vfx3rxEK/7vc0Pf/uYceZv84H1NgAMgGiyP3ucMSi1WAKkz2rj1KzYiw0l+gJSsJOa
         PpV+Tp/MlNWGceh1HQzkSTyrrCF5gjtBZ3X5QHYRvvVR6fFRZ3vOG1Hvz4pfT+7eLyaQ
         zodBlW6KU0PMQXqG/l/iGu24cvYlKhbGT3aJYC+7cFRubQoXeTRlJPrRq5PBtIKySn+B
         y1wgGGapvJ2HeW1zeUlnujky4zvSKs8vbkczwPC7gGZ9PraV5jx51fxnZ1BhklCQmIib
         PD1AT0zYNFRmB8bkmNLvHmILrJEc3sr/UFEn2cLcoTAAyhqWRDSWXBs95670Lrb2Aoq/
         YX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374276; x=1791979076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+vIXiX/mjRU+YsaJ8VH/9fgBHMd1MfqMWX0vbIJVT0=;
        b=Pl2bbUP6uCVu9otj3R4XkLuiguH+pUN168Hrde788KuUs+POgrt8tbtzT5Q9rHofZx
         A47t5nDV+V+tnImz8vWWlLo2Fm6L+/HUkfUpkTcfrpzesnZCU4zfbqDB9qyMhZh8WgX/
         3qw5CjdxEpVwhl/mtLuWYzLmBsqIrUA1pHpVb1FDxndjq0HlWYXEVx7YK+eMxoXP49j6
         AluX7hgDMSTOGaaCVLw4YjEpel7sURfAUs+Q6VdVadL0MNo5G+/TXgk25OSVGGv8N2vk
         /2Jw7tgf0DU5lj4T8wTnyeCjwdJdmw1+BKeFLSsc9KSQYFUY6K2l7lIyYFKtanao+e1o
         iC1g==
X-Gm-Message-State: AFq9FYIa6KYYBsg9aeynhDYKBb/I5M50yKPaDINr1IPDanNfzxlCrROm
	fAEl16HJpr8xhsz1ix/ts0YsG7O3pp9u3T/3TycnT7uW096rDBpsTDfLVzZbby04BdEhtBM34k8
	uFqfeIt1NLi9IKAREZiTXPZ3A2SD19p/luEW+Q02WReyBmOn7s/wGsCGcUhXr4vg5kXCHuh2wTA
	==
X-Gm-Gg: AYBFou0+N4i8ZLCiSLndcJipFUWq9EnpiSCAaEzA73hoFWmCI3Do0RzhszJqNm17MKB
	hw3zbKX7u+1pC5PAifvCjFkxHMBODMvoa7hk1GQ81fE7BljnBk6ZSzBDAznJXkB1syGenWwX9iT
	q5XI0rp4p27mibt3Qk8YUndAFNqW4a0730L4OCfA2OOb84jxbRw5Gx7h4EM4llhpWVICesvuwIy
	KGkTGIruemVEmPhaG8o6OEkWbDVVVBBYCRFzlof3jpVtGaudinTdjFKXFw2rciNGIYTp/cvY/Vl
	tQ776gvyulC9biSPTFAzDwDJb1l/2Liq3f6mEDpq72eR59kXzQiZp8mr4W+QsX9mCtfnThRCmVs
	V1L/9JLhzWco+kA9AnzOBWF/1o/xvZ6+Pkb7gVNaL3I1tLoP/NbdiEIw0ND1Yw6cW/9pHWLNef0
	duX/gYBjc2iC8N
X-Received: by 2002:a05:6102:5811:b0:7c3:440e:6240 with SMTP id ada2fe7eead31-7ca38b6f982mr545768137.18.1791374276067;
        Wed, 07 Oct 2026 04:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5811:b0:7c3:440e:6240 with SMTP id ada2fe7eead31-7ca38b6f982mr545758137.18.1791374275567;
        Wed, 07 Oct 2026 04:57:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d33f1asm5572951fa.11.2026.10.07.04.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:57:54 -0700 (PDT)
Date: Wed, 7 Oct 2026 14:57:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <kptf5vgtuef4cmw3wspo3ufl537xmr3hvh2r5cq6t633xv4eqg@qxdnyucqjd4o>
References: <45e46e48-46c0-4a9b-b0eb-e1c5ca4f4545@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e46e48-46c0-4a9b-b0eb-e1c5ca4f4545@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX+gvk6GKAneJW
 BgoaPDAUlVlB3a3TTZY92rI7WoPq4otgc7NvlhWQ1PAMU6jGrSuSuTqzAt8yHMlSlbk7x9rymYF
 sPTbxtawt7JxK6N9rcqSM2ku3YDyAs8=
X-Proofpoint-ORIG-GUID: SD8ab_FSkBONUvbx10ozfrZFdNlaTr2u
X-Proofpoint-GUID: SD8ab_FSkBONUvbx10ozfrZFdNlaTr2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfXy0zviVt/+8OA
 m9RcdHISzBlCrbSoHyEctLe4MJjcCCptsoMWOqeoWm19e51XbPkafhN76ZUNTTQjM7nv93Jn3Dx
 cQ9B/mBYhrfBLLL7gqcUfobrI0X7x5zoq6DN8VQRh5xbV1+nJxel5Ub/NHTZzy1mUReKUtsV2wa
 +mL4ZqXoc3oBx1ew4nk7eyZGKxAvSGxws62CQV/fR3/HeARWdO77sdAdrqgJnwpv9a5MlsYNU45
 akjIQeb9q6gkgoa9l0S9+J7yHkbeKUHPRSbw4MSSybrWQT2U1KsnPwi2ErcrSXFNFU7m4YdNLQt
 sQmVP4SztijQ7+H2T4ThVEuLwCOTmAED1tQffbrxmQLZ04A1+TGCRP/xZRz6jyNB7t/eEPbxJVv
 Ucs5UW1t1Amk97aiD0qd9gUs30L/KrB+W1U0RZRm0EdUBRVIAhax+Ft028KYu6lrnDC8S1ezboW
 DoAuKdXNUJTvRjn/NVQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac633c5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=41FRcAJqNbyYHCP6s2MA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070047

On Wed, Oct 07, 2026 at 02:25:20PM +0530, Saddam Patan wrote:
> The following changes since commit 79104f902411a949afe1da25dc25e05e3160fab0:
> 
>   Merge branch 'robot/pr-0-1791302343' into 'main' (2026-10-06 16:25:17
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-nordadsp03_6
> 
> for you to fetch changes up to 6c8cf886ceac8745e9c34770e613700e887ad1e8:
> 
>   qcom: update HPASS firmware for nord platform (2026-10-07 14:23:39 +0530)

Could you please write a commit message. It says that it's an update of
the HPASS firmware, but it's pretty obvious from the commit itself. A
high-level changelog (like you did for Glymur ADSP) is appreciated.

-- 
With best wishes
Dmitry
