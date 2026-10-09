Return-Path: <SRS0=1Q+e=H7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679D2CA5FED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 07:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42A131F00893; Fri,  9 Oct 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791531656;
	b=QkvrL4B7Ma0o0QYW9rg52gNYgJJQt621yHvKiuIJbqPs8PGvIgOYg2wNyHBOkRgG7r+X
	 466D05aq0rzqo2Uj5VZ+LKDPJH4I0X/jzEADvaJ0a4ouKsDy62UzqfUud+4s9YTbZgss7
	 QDFYLe+JfEpOKQPf1jjWCfjjxA5WeWcQ7TD+W3SawvIKpxgqQz7HytlV0ustD26Dhlzgr
	 QhTqj8KtnbWX00CX5dwVfaun+l3g2/M55/oteQ/4JdPBPvQh7Z3X3OA6YNjoeRYO9Rtm/
	 VF4McEsy/8Rq5SvvlCYGq7REHJwmSnKUWWBMDUE+lgYKCAMwQNxCARaOi2bxsQt6jjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791531656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8raqBNfdFpP/uFn/TIG8bzcH9prMRwGZx2YfboeqGNw=;
	b=w0wwJakDgxhrELWZHAwabwQ7AGdFufisCnhdwecqH3uX6rWd31rVjy3XR5QP+0DC3I0C
	 m89t3N5tfOiWWmLyzOYwYKvohk2OIZwwAAlu+/fTdlmLYXHOqcxdwVHHRpOzCaoeuB8s5
	 mEF2CMYSYokxyW3ho9KBxfhQ7QCVnqtx5eVasubZCOBA3E+tboSFZH8qz7VcQY41lfazY
	 h9sUErzG6YysZ9eszCHlyEEkjGZJoShJAxB/e/QrlMf4Q1lPBNOsHc1gcg48rYC0W46T6
	 n1fr24XeK4/JSOa/ovq4l2tWwxZtZVdIMfxQNKSLaH1VzIn3ObfjJXsAPBliq3pIhnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT3oNwvb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cLe3bpx7;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79FCF1F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT3oNwvb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cLe3bpx7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 79FCF1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hhpp250728
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 07:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8raqBNfdFpP/uFn/TIG8bzcH
	9prMRwGZx2YfboeqGNw=; b=KT3oNwvb4NerjiNOiZwq4OhZ2++UZahw0q07NYPZ
	aV/RsP02s5aAW7dxo+f6DW5cA2HYpPFrxeMGvPHgCTRaTty0AOPIW/LFeaERfC5j
	BeY5XTKVSZbkD+TI88Lw4yC5NKFaNlg0IfIvbEuvSWiFWBYEbFDBoWT+n0fQq475
	lSQfCZQr8xcHtmsnyjq083skQ2nyChuzi8ZPN9mI7/1Mg9zhF9CZfnc/qLd1ef1b
	U+G+FD/oXmbIN17hoZ1ex1NGsV96tOBVqMSN/TjEY/feiWpZCUSlHefWrDeIGJJ0
	s20OrDPmW8RcwZreujGswTM6UYXt36T+VHnwb1FFs0tKLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqtm7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 07:40:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso698461285a.3
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531654; x=1792136454; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8raqBNfdFpP/uFn/TIG8bzcH9prMRwGZx2YfboeqGNw=;
        b=cLe3bpx7WGzMip/4RGeSIegFsIz9rsAOXuyWoFCUjl68Foi1Vb35yaB/DvEnqCvF39
         mVUlnsF16LZ3yvMYownx/eItw9qLPEnhRy7Tuvl+b8OsPKpWO36aKzVg+VOXFkVnJvkW
         rjYr/Oo+l9xWfXvugCI/bVZERGv0XQrtH+hb1JwuUzOPaHO+cg34EZlHe/UYhiilsXR8
         FcZW/plwfFqSgdU8oUkiC7Kbh88yR6bn/gyhuCcu10Lj8r+30een04jGHPR+sqiuymvr
         +VmYjikn8vEEKSdeTGAtCtZ2wxgOXKiK9ll/FMuJr8M0wK8FEuMb7QIwWx6fLlR58e9Z
         uRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531654; x=1792136454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8raqBNfdFpP/uFn/TIG8bzcH9prMRwGZx2YfboeqGNw=;
        b=RzRgbt6OiBtLSs+uUcsd7btq2TdeFyu7nc/0+9RE8QqZHIRRhJM5BYeloHtR66SxRw
         l5LW6Gu7/IV+GBXMkjMViCZC15l0WRdsUPPxQikIPQiZq79nxGaGC8o6PQzPiKi3vWMX
         YryE46Put17qdLZJI1F0MIcU4EH9oj9ginggFf2fOo8MxBe4FZV3d3k46ugyZAjQYDQB
         QIle2WG7oL/Bf1jJGPFZ2LWz9LGwUCnZxDxcJEd9KM9RNILdO7PPBzdyQaIm0Bx7s9oZ
         I9U7uuHObDkCayqcsIDjEldY98pVQ8EKcaRgYOYxyPD6gAkzRDxRVJqGe41t9b2y6KIW
         3r/A==
X-Gm-Message-State: AFuF++m30xsaL6FpFmmS3UBXWjAHepjh3XRvYYwJ4NLVRqEJ6e1EquFy
	FFqsOXPq+awqaZlMer4asGy5t6/E52uppKUHhC8d1E2L5OCAXADAmyDlklUTdZ2lmCeqnG2qYsp
	Sqyq11Xaolj/LizHg33cumo2DV0pT2dWKAKyQiD500RPba4LI7ViIO+k/QvXWNMu7xP1pP/rgfg
	==
X-Gm-Gg: AYBFou1q1mTbeUOhuL65HgKeiLRBJiMn0sY2ISW9iWSz+cw0HJ4qi9u7pDQiLAotFMN
	cjd+UG+nKQuLHCjUE8nmtSOvCKS+7kdwGjBP+/TCjeAiXhJSm/e+O4z/SKHH5zPX2GckELIy1nI
	YevedewwHybRQAq8wuqXpZYh9Zmh+LeR0XGX9l67/YuT3Wj4VaLpfyZh0gRsYHU/5pQ4GH1/gJ1
	Byl3Kr3hCG1nYCnlSnxb+UM8xnBQLidg7u2N+BPvRmdWDZnLP8CvoKrWYG9Sjo7jKjuweaGoOLc
	iqUM+BOJ6eollov5djePHnRpQOHUaJHl56gShPYy7VmiYjShtAt5+Prd6WLd0h93c4G5nn5ahdS
	fSSTBOa0AOoLDAqzBxQs49mYEBID/aaL0Uv+Q+vQbUxOyCJMPE+93PhENK2xSWH/WnonmqnlgM5
	X/8Gzxjw7AS5eB
X-Received: by 2002:a05:620a:1a25:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93ec12d05fdmr41670185a.73.1791531653750;
        Fri, 09 Oct 2026 00:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93ec12d05fdmr41668385a.73.1791531653166;
        Fri, 09 Oct 2026 00:40:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm403776e87.18.2026.10.09.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:40:51 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:40:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <oqbhmu2snqvlqqqve27blva55hqgc4fs5g7vtu2ktutudomo3m@2ug4kvnniuwn>
References: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
 <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
 <d281437d-96a8-415d-95e5-ffe837cd4a0c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d281437d-96a8-415d-95e5-ffe837cd4a0c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX2Vc0KjjJUqXF
 w/jPZW65s22GnEdPf70pQj3LlePBMJgS7MpcsjLrsj/tNNIXOJLx1AEH8NkAKboS4o0fkc64yPZ
 sDnVBuCLbX+5rVKF1jCUEmz/uUcZTvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX3I6edlRhVkBX
 vbGOgzFN00Tzz4PFw4Hwmc0UUKQchgLpJC6XuxHyndju8NlNxELKfdjYJEl4eO2iCwW1g49TTdK
 bD0x5/4QSciXAaifXHOLaPVvXjrxeTuCiC+Oje3Eky+rVHl4gp1G6mJgWaqQaSyrSseP/HbpduG
 Jd3vNFJTjj/PE121SpY+weoRDdRAPXmQx8ST9x2bpZmX9CJS953ddfs+DBITS1BBE1KlhwThxC5
 fECbgU66Ut7l4cezOtHbSmD5Xz3nx7G7uBT2dOSWwOpgoL1wMmUjVmfkWl0gC4LO5G6AuCgragy
 2+sDO7nihVxDMYxJy6S8V5xnChD/vqRwh/WqUlzDgVctrODJ02/xR2SXzWfjXFVr989ArRj0BYc
 NKBvdKNqJcaBPDBTOlvBEC0gkzlT2UlQqX3ESMxZV7zXVV5p7djWEMJ70xTmZnLkAoPsN3/JxFc
 SZzTPLiBwmBMzY7Yi5Q==
X-Proofpoint-GUID: JWbU0yhcTS_BB83oRBeoIrvZXgt0smb1
X-Proofpoint-ORIG-GUID: JWbU0yhcTS_BB83oRBeoIrvZXgt0smb1
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac89a86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=teD1ZyU5AZT69zMKMAwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090030

On Fri, Oct 09, 2026 at 11:19:31AM +0530, Saddam Patan wrote:
> 
> 
> On 10/9/2026 3:27 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 08, 2026 at 07:50:36PM +0530, Saddam Patan wrote:
> > > The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> > > 
> > >    Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-hpasslatest
> > 
> > fatal: couldn't find remote ref dsp-fw-hpasslat
> 
> dsp-fw-hpasslatest is the remote ref name

Please don't edit the quoted text. That's not what you've sent. From
your email:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
  dsp-fw-hpasslat
  est

No, robot can't guess you've inserted extra newline in the middle of the
branch name.

> > 
> > 
> > > 
> > > for you to fetch changes up to 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856:
> > > 
> > >    qcom: update HPASS firmware for nord platform (2026-10-08 19:47:08 +0530)
> > 
> 

-- 
With best wishes
Dmitry
