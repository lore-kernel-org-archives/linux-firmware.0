Return-Path: <SRS0=EHhp=HB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD4EC79FB6
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 12:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 493F21F00A3E; Wed,  9 Sep 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788957654;
	b=1NiWH0LU9DT6heRd9ROSlDHCC6VLpFq54Hx+b8/1PnfXcyh2tYGAzZswEv7FPWbe9o7b
	 I+g/uEFeuVzjQWzDkBL8U6cJ0O7YvU6jks1QKBPOQv/ENoFnBRYWLak/PXeCRxr9NZYNT
	 60obcRwKKdb0BV+AEiT60e7lGr4K5PtDsjbTb1nxcow+yRYOBCLMs2Lm36dnO7GioXVEW
	 7uQ48SghHtKkYhfczELvDG/l/pvTGVdix6ly4xy1HW7dTc4+Y/LqsaSzn2syoq+1mAZHZ
	 1tX2loD39Rm11I2hZfSAkvTuo5FfmXTFzvF3vN+REN3Y7seXGG2iq5J3QvwOOPsSJOA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=byXMO6VAGJ3dNIJVW7t8iOaeiuS8lTiSFPglosQxgtM=;
	b=An/j/gP52tPX+TD0XJPpyCLexw2GgMhIWrTEESPA1/wBT/Yp0xwmGvafWrE/Sl0J0aqG
	 rU6vLmNq9XOWiZCeHb9wu9BPkHiwkK3to4rTbJZCdw3djXHCrbO/XgPmnEMH1+woBWLvT
	 PxyHEgeSsjQ4i8Aanq+//rRnouENBKrb/G0kADT3HEps49sT/gktTX0RcbEGDwGzgYE15
	 lQ2iyyhk67GOJur7Dx9nNlgaPlexA1gAuwD7s1gb1A4BoVA+PyvUURwLDifMkP5H94m53
	 LS6ao7zxlbC6K5SFp0SQkrT7vv3vDEant4hIjkVmMcCG//yPffTgfqQOf5Q3GB/GQWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+x7lwZp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UowY9xg9;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 994CA1F00A3D
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 12:40:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+x7lwZp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UowY9xg9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 994CA1F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2UV1723071
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=byXMO6VAGJ3dNIJVW7t8iOae
	iuS8lTiSFPglosQxgtM=; b=m+x7lwZp0/MxwdZwIpUMZeqmCUKqwOfWwORM2ynO
	ir0zjIHD6eheY27JFi+T3d7aoFFNREPdlMAvcLMTxfV5SMFOlm8AnHTItXKLBN0c
	QpEcoMHpTRK/rGQKBRiMC9qnu//uFv/IkJB8Kd9NXddpzNJAOx7t0KBHG/dzOrmp
	G7nTgfQkC8EE9JD4ew+Oh5a3ouwchMEVTcrMNspU8v5xZ2WKjUtdAJFvboiIHazb
	zPk3TEbrIab8JyoieGmnhz8OKvPV73UXdXqg84ZpPn+VX5sArTBMrTN919W4nZSc
	d6eN5NbfDqtvREYmLN8b9l0aFwvYVno8SmlAbdjQOzGygg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrjmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 12:40:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fea4e86f5so472865137.1
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957652; x=1789562452; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byXMO6VAGJ3dNIJVW7t8iOaeiuS8lTiSFPglosQxgtM=;
        b=UowY9xg9PtxXlu2hw3jCDR+c+jmD2zv6jTi7I4tCPb6VbsEL9ufrivTRBTo0hr//rK
         II+QmWFsLfbcfwB8CYjSYF6uP51fHiTqtGwKv4UZzl/fdwb0U41w8DjTtIZcI003CVZ0
         ber1U8lPNA1sWreOSCddNsxo2r2azqHRlj5lv58S5gg0s1ZPiDa7EJzruYDm2/ceGJHK
         N1gl+pWknCUoHrtKMOk4bEa9gP8INy1TbzLs3sbwNsrlkOgJiS9NLknwfKS6Safs2aEk
         9Odvvz1zQiBUeOALJ9dWwr/pZa+OSzbbkuF8beHg/omIlWPwIOWNX6ZZNniHGKLu5hbh
         JOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957652; x=1789562452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byXMO6VAGJ3dNIJVW7t8iOaeiuS8lTiSFPglosQxgtM=;
        b=eXNbFER7WfK0mKUFsuDHQsjJUBJUQb3pTvx9xBevTdV/MzVYzSGLZDmAtuwjb2+XoM
         wExecJJp8QbtjmQIPC4oHTKwUwHkbnuQsZIuRDN6H+P/cPSTcywigI/wgwEmgf5qmg1h
         erZy3u+EK17H1B6JtCYNm7dzN6XO/emm5R1GT1gfgptrUUP8pSIFivhRqYNAYGhmTnB4
         iF3c83X05YqBQgmjfVrhFB06AdzkxpajWzP35m107L0CaApNmcCsxRYZDA2/UPqJqWbO
         pEe5q2lOMZiyf0ZPxxfrgYuQPz/0a9ipDAw4HDJEfsX0ckIyxJoQjc1+EKjrklduemoB
         /u7A==
X-Gm-Message-State: AFuF++mm7mIdxs/k0l0wMofa9Nlp83B1SFeEE1Vr5QkCm7chGUm0pSPt
	4MZy2Fg9Os2SJiacfzbGmJAKyD+EljvFhN0ZxFtFE1tMKGMpbClgTV3Fcp/+ZIbgMoOirNW/vbq
	eLsDlg2QONWYdIciARIuR3gPbBWpYv5grNnJwbPTSJFjcHZMnw3xgVWfahYZZHhLInFclPeI=
X-Gm-Gg: AYBFou06AJMFaIAbRMgqNY1dxGSw9oWOBvvdZvo4q5cRj8rrv/kJV9qpttlB7QuV8Db
	5OSwyXicPkbklJ3LNR93lLNFFFsrPEM63dZextXt7Q0/kKwFB7l1v7SIK7WzPPmFBn2NQ1BCQnJ
	gFFnnbrrAeqj3IAaq+PESN9/3ySp+mI6lbpu4jiO8MozvQDvOJYe1JjPkrrcjVG/apntukWx8oa
	ydQW9tuDVP++dIZYR0pOR50sbzXcwBNJS5h+RNU2kWZH31cmbJ6/KDCZKA2t5vvLPRK/b7dOfKN
	UcIWGbq4crL6mVJbRW7ua21WPcGVQXaf6rooAMYYNpSm1vIrRmvj6fgcE2PQSAAY/rWIS7VyXWM
	hlm3cTuXOW3ORWByueq0Z8A52Fu87/VZWERwemO6cb4OxBlPfVYAHHDtvKZekreXnqL9/OStrg/
	S0SlSw/4eAw8s5
X-Received: by 2002:a67:fe50:0:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-78a5bc06bd8mr5707665137.21.1788957651717;
        Wed, 09 Sep 2026 05:40:51 -0700 (PDT)
X-Received: by 2002:a67:fe50:0:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-78a5bc06bd8mr5707657137.21.1788957651300;
        Wed, 09 Sep 2026 05:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705d2358sm41427991fa.38.2026.09.09.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:40:50 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:40:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for qcs615 platform
Message-ID: <3odbbvmak6ecbrvkdzqljns6fbxbs7p3rvd2gkemxzpjtshrdb@hvjh44outokg>
References: <bcf8eae6-b138-4d00-91f0-3cf3c849bab7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcf8eae6-b138-4d00-91f0-3cf3c849bab7@oss.qualcomm.com>
X-Proofpoint-GUID: vrQOMM0tGLXohqlaDu_TSoVRCZznORI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX/HMdMx8djiqQ
 DyZyoQT1ZJdfmDKQtFveX1G99NL7sxaOFFld2zHogOJFSV64GGB6KxKXzxl/3EcvtrWHh1n4q7X
 80wthm3kYDYw+4xdc31uF+JmGONlvvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfXzrNSCxMsc+Ji
 Ccalatrjr3ochsXD0gj5j2OHCRNgQKXeOp0W7FBLtQRZz4EzpujvVsaoIxFdq3V9C7/Mt0uVHvE
 8IMU7vugus+wHzvCDwAtq+9+ErC4E8uWgabolJ62vP/pjMW0adE4r8BMjLmg1IV9wp/0IRNyMtn
 mCK4Hv5A09DyYV3J6Co1oNzsK3ghBoH6jFuxP9iLRdf0uWxCLk/DR0XtGWwXHAeiPBSGFNUfb/U
 0fG7FtJt9xx8+4SszKuaH60iZZ0NGuzpJ9iMZ+GwUgUn+p3xaZ0NHxjWRViDl07c9TeASoJPVc4
 DCxXNPG3erdie2DBAOmrD3KNBy9ZKUazTi0FJX6oG315KGwSqjGbuVViiU5AmFzMEZpFZFvCYvM
 S4mBxVc1JfNWcObypPhb5ZaAHgpZrpOFqEcYOykihGOI3ypOYUz8rRfh+yUxQIcDqrtcCr096YF
 PTLcpMIn+SA6q4juDhA==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa153d4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=C5mNPc5nWw_qRLBQ1TQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: vrQOMM0tGLXohqlaDu_TSoVRCZznORI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090140

On Tue, Sep 08, 2026 at 04:39:04PM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-talos_84_1
> 
> for you to fetch changes up to 6c08d389b7de722804781d0e382552d1c7a8373d:
> 
>   qcom: update ADSP firmware for qcs615 platform (2026-09-08 16:35:39 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1222

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for qcs615 platform
> 
>  WHENCE               |   2 +-
>  qcom/qcs615/adsp.mbn | Bin 8532108 -> 8659084 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
