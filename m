Return-Path: <SRS0=5160=F4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4273CC55838
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12CAA1F0155B; Mon,  3 Aug 2026 18:05:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785780313;
	b=TnP3jUQezuXF+LeRz2FRsT8V2iGaAbg5fbon9k9iaKFkqMUgtK2yLEQ1f4j1i5rlNWxx
	 +/CohMafVYZ63M2NnXLnGloK3vJW70mfITgYhWFy7dNPFSTt5vJ6F1em/z6FfQDn6ssYD
	 UpL74+mcIanWSAZ7SixeYO3IXyfaTDA5+hrGUmY3lzC60EkYpAZg7J8RYVxpTaJHzkxdl
	 XAQ1ANGMy7a1I9n1z4BESzDokl6sw9Gw93ttoUdrISFuzxQ3eozYYlatSr6CMshzez01w
	 raSexI64afrQBUEbed1YLsoZu9LkqbPTX2km1q19h7ImCKco0e3FoMlgmTn80FHGPEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785780313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1cJ/PIygSWYe1WN3v/j9mVylW1O63e2c5583aTHdAyU=;
	b=tZzUlujeevUT+IzS9KDR8HJwP4+qx6YmfP5SSeAP1yLIQiD6+g5DdrTc5/Ss+ZRYU5pM
	 wJSqYBkzqYhPlOuONuH2xJRfOqqA/eX2gDjeKrk6pyDFruC4S5CmslNcJaf2+Gehu2rfN
	 ULLCPCwa6J9Sh9ZzkGp4FG6BA53P3XwL+WJtNgbvWuKGKtv08AbpZivaR1mIf10BlWQD8
	 bFjZNHebqOJy3qlA/7RAxZU1r9ZLJoQQwjCYFSTzExhP2V1r86SgzVj9ZoKgGPwBn4Y8i
	 gWl7hHa07OMnia8Dlwht7HJimQekx8X8f5ILkNEPvS53Y9E/59fRD/vdX4KIgMFWJTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXCvUH5t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cPWlWQ4Y;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34D191F00ACF
	for <linux-firmware@kernel.org>; Mon,  3 Aug 2026 18:05:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXCvUH5t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cPWlWQ4Y
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 34D191F00ACF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwK3H1529999
	for <linux-firmware@kernel.org>; Mon, 3 Aug 2026 18:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1cJ/PIygSWYe1WN3v/j9mVyl
	W1O63e2c5583aTHdAyU=; b=ZXCvUH5tGnzFgpZFl5gJqAflqBRxIY7lq3yf8O+5
	hp0lpF3K1OwU9Nmz6BzGpFAGIV64zyUvE6R/HTHkW+2Swlf8sb6x3vqx24uF482P
	xEqmkxxhC2oyQS3XlDATPOPSvp57xYSXYHMGwiiLrkj25kSD8x80zosPneNdgAap
	UF45t+7iHIPWcSlTqJuAo0u5ar8KJkYggefBk6knXLMuAupQAwRvhsMC/xuTFuYq
	CW0i1JH/VPYwk5YOrZKjdAmUbO7bFYeCjqxGIJJY9vHPC/9ZhwZETnIItZNlskES
	wuNJFOWNou013oO4bpN4al8P+PKoO2JtLNmmK9F7psUKkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbay35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 18:05:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso2307851cf.0
        for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780309; x=1786385109; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cJ/PIygSWYe1WN3v/j9mVylW1O63e2c5583aTHdAyU=;
        b=cPWlWQ4YtqEgjG5vRsGzLWXV8FqipjnHsiOyBsuXLTrUcXFNTJxJkaxBo77K1HFoU7
         +5f8llPFxBeUDGE2SxoRO6bRVrSqYz2hWmW+Mc0vE+An84yJhQiLkH3F5AQBxSdjXtNw
         DcYwEiz5HonsKMv/rXE0G+F7mm2hR+8d4ViFJwVa0LISEdfSa9TnlxZA0NvM0L3VPdp5
         ZgRRnuCoz0H9urQJMJ009RNRoTdtByhiV7ODyshK3T/m+m9Hx9310rcMYfcLdFO44+Ri
         0DrO7JLQxPy321p7a0qJW0eiSwaXQgxhiPoJjJ8bdLSTNQO6xezpI/X23Kww8DiPx5oQ
         DMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780309; x=1786385109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cJ/PIygSWYe1WN3v/j9mVylW1O63e2c5583aTHdAyU=;
        b=BDnygroAklkC9TmoyxBN6Y7A1n4SU2Vm4BBy42ERRlrxP5kZtLK3lPa+YC0Jv6KTzs
         CCy8Yc8Mi6rvjsAp/1MlSB/5yJA96gpu0qVW6zBnylEQM+x/FNwfPKG8zkyl1dCqPnTK
         QTSIoP1tgXPhviEV7vXo8/GuaWxfatQmKrgbe7M3uY8PxSGd9AVSZR6HTM7zMR/k+H7v
         duzyKxHIHXzHoVO6o1rv1S1r/J5sUw2g32BpgVNSEZkmn37nv5wk9Wu4GUq2/mCzf2Vz
         N6LiMQk8I16I2lurbDhnh8uTqyIHLvoypPmQhSc5NuEYNCuMuwkL9edqd1d1lVYxRH2v
         abBQ==
X-Gm-Message-State: AOJu0Yx2XurYdH1Y6c52MENkZaiajBdrmNQwhipuZjcwzahG/bHO014c
	q9bEflnG53g9qFWk+bFNelk2ZTECMfPu3gZrMnaroP9xmBSY8FzAb6VJqsmQCkCPt5xMwvizonH
	qwVTcIYJ5lQg8hHV8luNTcm3/84i9iV9xHG1jdDwzyK/6ZbwFjW8lAsECoQMmLMNZ7WXGltY=
X-Gm-Gg: AR+sD13SSPwZTyB6yn5KC5Bka4Or3obKzk9MKoZkE3Gkx+IfrRHLLM/SyYOT4QIZDCL
	cMObcGj8AOtVOTZpUCxr0IlamFXbh40MB9Kg4vkpeJRhgI7U33FQeStr/SMB+OLFpygPChg7Axr
	vYvIEP3oTzGYDC5GA+red8siKq0CaOAph9OZpckHOXg9hgh2wId3izLZAtxUSESNbbpj1Uy6UJr
	zLtULzN6t3dxe6I9a11BVAUB5fNWejyk8b5LOihpdW4fM2BHJ8/Bba0gShfAf7LDH8dWULtnKOR
	PuN/T/gcakHfaKCH9Q2vgHcupuYjUXziPrRKDjR2ZiooViXbVEWZ7HHQMl9KNds5lzk5wxQqeAN
	0hd/D8ajPZA9w3eQO2a+iviRJm16c1y0cBybwmHnmwaKS10d/cD0Z0hLzfEkdQG3R9+c8qCc7MV
	dmnRaGi5PKfd+l1A==
X-Received: by 2002:a05:622a:2585:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52cd353fcc7mr11857901cf.13.1785780309299;
        Mon, 03 Aug 2026 11:05:09 -0700 (PDT)
X-Received: by 2002:a05:622a:2585:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52cd353fcc7mr11854891cf.13.1785780307512;
        Mon, 03 Aug 2026 11:05:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbeedsm2215874e87.30.2026.08.03.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:05:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:05:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Eliza chipset
Message-ID: <hbrhkf4opfo5a2p3gnecefabpwsrygcuxvnjj2gtsjtrew4a6s@p2dibbwk2aex>
References: <fe4cf09c-4ffc-49d1-adc8-52dc39ae8a0d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe4cf09c-4ffc-49d1-adc8-52dc39ae8a0d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX5amxILuW9j8a
 aLI2FT9ilCHEob+d1d6cez+XZ86hRfNYHCEjhCBEDr7Vw0HhfdVqkZS89g61sjPCxblnfALszDo
 Fu8DE72v+rjY8MNa0OJlXhBvhMX2guY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX612qCf6Krkh7
 4rHYvZXdtEvLc+ZiN/GXikhSQIrv4B8/yk86oUQXZidLLbDVbgl/dJAGCEhWIXOewcnqK+BaQhj
 kGetFgDhp892ErGRWSxIuKULVDHJnuvorLUu/1XOH2DOv/WojluIv3cJ5NJKvqVl7kP+edE1Qwe
 1kwQDyoEuIxqhQ5/4rRS1QDxfQSDjAlbrITp8LNyxpIPXCZ8fDRI7Bvl6CUww0I2B4FJ+cjN21g
 spw2N6gGE4lCvAqxVNPcyyVE1Wl30gjLXtGbZej2+dWtTwrhhlDWLBrbHie0D6Nck0c/Oq/qR44
 XDf1tVpBO0ptYXN7Kmi7T5d5CiDwczm2QA2BrfWVupmAoNcv+FqQBnR0frXDIib9jTX7LZb1Pib
 qk4lI2+qCYfqU5cw8HIhaDvjLKWaeSc1FRg0U0xX75Phy1U/ivz8SSK63ucp8qONNubS+cWADZi
 R+CPBhQ3awFrHHrXDcg==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70d855 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=hf8TNd78OrMN8i2P46AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: gBoGTjw1LK2nUc1NuQToecSchxiQiZzx
X-Proofpoint-ORIG-GUID: gBoGTjw1LK2nUc1NuQToecSchxiQiZzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030160

On Mon, Aug 03, 2026 at 10:46:47PM +0530, Rajesh Kemisetti wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's Eliza chipset.

Thanks, merged and pushed out!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1161


-- 
With best wishes
Dmitry
