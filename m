Return-Path: <SRS0=zzlF=FW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB02EC53219
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Jul 2026 10:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82E2B1F000E9; Tue, 28 Jul 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785234286;
	b=YLxWn3KYmItOIBJXs5PTzM8yni3MFI2jSwueLutBmv0Zaldi5dBR1yUxEODCD6aj8Jpl
	 LWvBh6H7KDAW6gsUVz2g7QKirilToPWVGPPhB14XRdHd6tw49nLC3UNUcRhvUbU3BiOJc
	 b6PgI0fswDCeGe/1CF+7kIbQHudP/EyT3F+L4PBmZH5miOPCeBp3J59EnZlWO5XuvoPAy
	 r0l7PHnR2AKi+qWpf50GidKXgEA73hB4ESuJYSsbnzp3lMnxE7XA1cR7SyoEn/XtfQ4dM
	 cJWcnD8st08sjgLnKYLz/fcDZ+XRm+ciZGxgni/yxXKQFr8m1Hhe72lWCB++beRP0MQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785234286;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X1jt5GCI2cFXie9xtoQ6tTj5EPQYoB4oIZ4bEzbzIs8=;
	b=q+lRc4qToN4AzbQH0EdE8lZAqTXNhFtYhgyx+6uJO6yrUsG5XaxGbDHtR3H8ZRSvJ2GU
	 3d7461JsYjCZ2efK4eM6ui5QfQaAmu0njwx7uq0w0yBYHm7sSIEaiCy5ni5GEystHCB/G
	 R6QSJlvCmPPoYOAAgdF9v63bXHKTmExTGlbwjs1eiANytE/kilA0dTTVsa3gk1Un+YsWC
	 dDqyeltwa8JTtfJYhZ2iwpNg3y5MGcG3MVtH6NavEpqP5Oz8IyXMJcXho/psDg7BaLSBj
	 hJw3Yk2u2ndoI8aqutDrgOl98BxLG+wHLX9XIYeBAJh9qo/xaQr3a5pVAoUfcROlraw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fRoj+TUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew0aGtaH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3EAD1F00ADF
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fRoj+TUA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew0aGtaH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C3EAD1F00ADF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S822GY1663732
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 10:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X1jt5GCI2cFXie9xtoQ6tTj5
	EPQYoB4oIZ4bEzbzIs8=; b=fRoj+TUAfLDX9ULCIjAOFFUQ9C9HvGFohYMOnTCd
	IjaFkkwLS9yH4N2B2affTVYkEkI/DblKUD4BarLMDrIC2ZWzAT0d9+98bIHZk2zn
	qbFhTBtfIuNwLNCNDK39grH0pGUcLHXaieeOrxSP1wsA8cAjSlGNBcoU/fL/ZSPA
	hmXvBVakdKqOcNDD2Y2AKoHEWGltfXsxJBo6eM21Go25BAgDL2MElaUO/TZeXl8g
	cYPxeiNumRBI9axKpaweIxI5plz0m9mBgkQZZSR1NbiyXcLEhKvrOGq+AWYVywjp
	7OLfn9qc6iWCXnrZlnu3KoHDBRW8I7og5D1KmWe/9HmuVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts2pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 10:24:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so47034991cf.1
        for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 03:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234283; x=1785839083; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1jt5GCI2cFXie9xtoQ6tTj5EPQYoB4oIZ4bEzbzIs8=;
        b=ew0aGtaH6MBpiTnDxfzhpA8SlaWsjU/W0E0JbZwEIZ7jH3tGYeFDtr8fXgQGYqSmfX
         fjkfjoFqeeff21tmF81+agUkwiz6pNQDRTLGayGcB2ybuHBgU//FuEfGPuDiAOrcHdw9
         +LJGXJrkUd9OoK1Z/upmvYZo0dGyWp+e2XCnIgwDsBQu9NByMoQD96WedJQfzF+yVBeN
         aBodRSegEjfTXEpbhdEegcOY9BNUG5fkDSvf7Z/08ag9SHrt3R/YrFL+1KQ0r/b555El
         fz5wRIQxPiHM1r4LRjLT3vUSMhJ8BWVLETHmxIfqfdansva48p3+s7BBO9g2CAL3u3R1
         u6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234283; x=1785839083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1jt5GCI2cFXie9xtoQ6tTj5EPQYoB4oIZ4bEzbzIs8=;
        b=YIGKI4QqfFv0frcyizV/3MBv2qzfgE320MV2I/BzXeYHJoPOXLx7SUaZvYlcMzijaB
         HZdqOFa1dAsSxQIWGIp8fFfUn9svPt2E6+Y1GdWO05cLmNgfAgFu1yHZQlmT0vmQiZMt
         t3eYxzx8ii6shCZN1M2IjYMa0IPxRp+0WVV5kmgHrwS4PNt8GgF3aHKuxXt+83RnaHpo
         dvQexZAWAZD7xSg59sw3VXu59KN2DUqqR2F3dXbwgYgP4e+VbAFqlqnmjJEVGU+RPHy0
         BTGGjFI+I7ulWRIinwNu5zUn7FpGEtV/iiPreEy/vi15/iGo0VtJ1KlqOWgHiFtVIf7D
         d80g==
X-Gm-Message-State: AOJu0YxyNKPcXPzCfXmR7pVSO98TE32b2Gmx9uOWpqnDWZyc2zYIOiM3
	4NAjFV+ClteD4mMbj7nHWvhePQR8cl2NDX/B3Y25kkNCj2/pUXMkDpuf8klyYcsRTzwMBWj3YNC
	7NNKMPVnrrUDaKjtIv8nIsSIMOo0RAwmYzz0xzeoBkaccyc3WECGDEsQR680dVPY=
X-Gm-Gg: AR+sD12eUGeTU+/x0v02AOm+sVHzH0mO5Gvz/0bgWBIwzrDvv65Vh7SzEIEn/ZorAu/
	Jq5Jq72i4pjw0tjHN/+dFEITuyKsFUr/GPHNYaUcXSqYklCIpzLy/2RIpoxGHgIC+paDSDrlYQ0
	gHb6pNcWrQoOaa9azA56eYyWLiMpUa4BQUcvcI7/2grFidZMvj0STdPTdMdlMEdNSCGCxVvMFBF
	pv6qCzLbpVUncp7aa9hiMwdfz1yxTQMOjrbvCsjG2QyDLEJDdyEGy/Qk/+hYm111vIk1fBLbEAy
	mcjkSPlfdStDS0OdWG556PcMHSsEQ5vhlb7/ia2pnTd0CY7XkpAjqyOPuwdkBafTY5qffMSGMc3
	tF6g3F55CKbgVFtjxAvSRH3Y98VE86D8r2N2cFx0rHjU/vg29eZhFDk4H4p/xOsbg5RL5S7u1og
	3am/0yLeHFqEGSKg==
X-Received: by 2002:a05:622a:1443:b0:51c:1291:e68c with SMTP id d75a77b69052e-529d6ff3909mr13179011cf.30.1785234283552;
        Tue, 28 Jul 2026 03:24:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1443:b0:51c:1291:e68c with SMTP id d75a77b69052e-529d6ff3909mr13178901cf.30.1785234283166;
        Tue, 28 Jul 2026 03:24:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0881d3sm1998204e87.28.2026.07.28.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:24:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:24:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dbaryshk@qti.qualcomm.com,
        raghukan@qti.qualcomm.com, vkasinat@qti.qualcomm.com,
        rajup@qti.qualcomm.com, kbajaj@qti.qualcomm.com,
        vkraleti@qti.qualcomm.com, saddam.patan@oss.qualcomm.com
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <73fak5bi5jzaupeoutdj33pte55x3jcrictxscpvgedpcawjmn@pd5deqglcd2p>
References: <823efa65-7b21-407a-a1f2-afbf7f38eeb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <823efa65-7b21-407a-a1f2-afbf7f38eeb5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX78XdUdL4an9S
 rbJYXunp5POtEG2tHSEqbEP51NuoVXVGm7uYn4ry7OS8d9HlcSYu8DccrLxfnPz8n9PzrNQSlRv
 5VR5pGqJW+brLl8Trvq/cBWDYR/KV6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXy8k9accQ4mvV
 aYXwI9WkOkiB+vuefhROONw//Ye8qEQuv83Cj/cZjFuj2I2nci2czFe38ZMtIHc8ho1pT/k0hPT
 EfwFVcw2bgcLCTOgl2xcST6XF4O/crQh0GPDo/gBeq44b9pYSTzsuftC/1D/XQC5+0SkQ16hfXE
 xAQvkP0q3s0FmTZkD+lpvzy4UOF0W+Er3+hDdBDOpUREiPDS+CxD+jExChb2TvXUtDbe924eUZs
 Ny+nGgfwr/N6NIX0Erlxan0bZb0ZV8fCFIvlFCs1IpLE0dmIPnwdkruKJroWd76wogyvVAfDluI
 AC1/kTi5bO1Asdh8DAroWvROy0/wrCsFZxwR48hP7JEIDzxs/YSEkDFMyp7Un5nrjjC3lIGE35O
 WK4kVCrMUbRCL6rMs7sFT65I+n++eYBYWU3VEMIoFuK6aDBbbkja3shjmByGAWgK2fpUha9zb5y
 +Bv6UWu7haGvTi2lPfg==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68836c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=J5xme7rm5rPuACJwVXsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: b-tXUU9q3sxw6F3beYNKqLyFnDTuGBPr
X-Proofpoint-ORIG-GUID: b-tXUU9q3sxw6F3beYNKqLyFnDTuGBPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

On Tue, Jul 28, 2026 at 03:26:18PM +0530, Srikanth Katakam wrote:
> The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:
> 
>   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> modem-fw-shikra8
> 
> for you to fetch changes up to 70c56065d969614d4fbaf957b8590822daaf32f2:
> 
>   qcom: Update qdsp6sw firmware for shikra platform (2026-07-28 14:11:58
> +0530)

I've reviewed and set the MR to automerge, thank you.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1156

In future, please correct your editor settings. You had one
unnecessarily long line in the commit message.


-- 
With best wishes
Dmitry
