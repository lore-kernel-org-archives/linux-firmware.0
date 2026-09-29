Return-Path: <SRS0=4qBf=HV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E305C9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 04:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 367BD1F00893; Tue, 29 Sep 2026 04:31:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790656279;
	b=lz0/5yRp/dohatTr/sU8DabbvOHx34pxPh8lwZKy7uSmE9HwegtVwcxf2HcrviPjgqyq
	 0PHqDIz5qpt3jdaA9T58PaWHs3vpZ+EyPCHz2WuRdEw6sLtoldGg7ELRuYOywbEj/cg1J
	 fdczJa/pKlr3Krz2gnV+KTd9UixR0EDARZNlZmt4ySdlmmFNQJ5CpZf4QMgMxyStwZkka
	 W3ANycm3YuLVnncp+e4phKjtEohU3BGzpo/M7QPs6RiAE6/L+jRda2hvEOZF58RQL4nP+
	 AXDrqSmyqO+BB29jo+E2Ts6uRvHdAcfeV3U39HPTRMPu0kKhYoNi/fZrKZc/dDajIAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790656279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cywaP6N2z933AipB8owMVtsa6XV4oKXlh7sdrNsiseM=;
	b=E58/HJ0h3XkXY9Fs4mvk/gsJGKguY9lkyKFcXuPZLmYEQimOHsvzNgAqkdFqmy+i2iKc
	 N1Z2NR9+NokwLsP4AuTXTlwTR87wIAjZSb52CQHpDL02D75KdENSI2c7wp5hLLv+BFlZK
	 /tEMzdSy02RQ6BIk+0vvabhB/h9c8RTbR8QI4HTR5MYjFoeKa3tZfjftpuatv1MKafTNs
	 6G1sIURh380Y/gkJgdt/oumgX33uHCWaHovJ9Xp2HpXyEZPwBDHtZtEU2KhMM9Zs6/xEj
	 z8znNhEqXF1E8jLWWHkhiG9ov3P8gkyFR+GsEAFd1KnhiM1r97OfFKKnwoPRfd92k7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hVDlSWQR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8R747vR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96E7E1F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hVDlSWQR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8R747vR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 96E7E1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46sdp317792
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 04:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cywaP6N2z933AipB8owMVtsa
	6XV4oKXlh7sdrNsiseM=; b=hVDlSWQR0P64o2bY8LORdto9g2hIgJ0Wm3JVGr9g
	yxzBNijm3K1CuhYbHO0SpR8/MTwyjKE/qrtiw9PSRB1miAkEwJf6dNNR/20Oqmo5
	RkrheEvZpv+WoJJ9g5debHhrNkQACneyEXZkf/2sL4R7KwH/MYrvs/+V0XLxwksw
	HmZeXnltd5KxuTAq4zossgjGpkab9SD0riJIcmHwb80QRLAMFRacRVztVj1K+KvE
	x5eFt3IdjaCKHonRkhgewIsQ3MppZoSnU5tKYEGlQqV1ywEn20FhGByGtVsjqX3H
	xYo/5cUhF9mFFQLvv98J11JSrn0Sz582jtR3YS/vBOSkBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03j4k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 04:31:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1069747985a.0
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 21:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656277; x=1791261077; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cywaP6N2z933AipB8owMVtsa6XV4oKXlh7sdrNsiseM=;
        b=b8R747vRNRlkgk5Gy0w9D5BbgfPnCK7qToV5f5Z9srrOTm1Z4TjxLMmhDJ8urABtV1
         9kJZcZecUHEZ9G2+rVA3C+NPar9S9mxtnIHAVD0urnV8KcUhN63nVxgy/v6qfOEXHrDy
         +6/5WRtNLZ6SbnsplxCdR+o/Dknueew3BLN8Fwkd8aznisvDPzYjkzsqQeIcF3mD5oz0
         HYvE03jVPGjTA+Ud6jOAgsGdD4Mb4SUzZ4AaKNg4nLlOgYtH/ccvZTZATgOcxfgMGAjo
         15Yyu+ZIhwjw6psddZYt0fWfw2xquArCZi0YxkCUzCQs6xbZHPgYt1RyyEviHy85szig
         rWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656277; x=1791261077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cywaP6N2z933AipB8owMVtsa6XV4oKXlh7sdrNsiseM=;
        b=cPw+rt5mtPJzeBTUpiFSUjIVd4Ti/Q3wWTgrFqIv+66H5Y4TugfOm69sQzLS6Bh/IZ
         1dZdAm4NtgC9k0rNjUi2K403j5EGiXqnNx5RHbORewb89TxQTsXxJ9PSvFvO+Dj1c61L
         Y/0q8x+TzTEneiSUTL+U56IZxLu4DKt/BjudNqdMCTZ5xGrrLY+RWILjcVNG+nuRIA+7
         cCKWc+7nx+WcwtDi8h55gq9gKIlFX6T0CBd/bZ7phS2cYxQai433rw+MbJBcN+PbzMVm
         Datk4iJi89hHz7qIVns1Z/BpibnFRTDR7reMyn39IHlQn2tUC6nX2fm4h/xpp9NfI/M1
         V1Bg==
X-Gm-Message-State: AFuF++noJ4WHbDXkTnObxLBfScsWBdVxvbLGywewDwmshXr2Gw6/JnlU
	yoeq/ShQE+IR0ZsaokaGvGd0GVv2SK4gd/tIufVTyULdd3iEi+CK2Kc/z3AAvgUJybpMoItVVN8
	2DwHWwBx3t9HdMkDPUmjT6Y/YHSkjdSAmKzmfBkuFewKvWzQefM2/CxJpaVc6IY8=
X-Gm-Gg: AYBFou1Q7twZLdsl/Fqqpv4WNVzAYhHLMBQ8UiKfBbDNRcc0PQY4GdS0rtU8f+ci/7+
	hbzV04N+mlPPHkG6IU6K5iA4/L9bzlafB8AmW31s3NxTftUgnwef1Ux303CZwgkCsZSJSih7njz
	Lk3Jg58TvyKcgDQMOmzpLHOyy484Za0zn4ws+UEoUHMLwbbP1REapqmQ7Ef2r4jcc2guj/E0huA
	5A+mZIGHuKi/mCB18l/Kr6Xl8GeMtTxhvqSWATyFXFJtaBvyLwh13v1Kg5/xeVj79fBGsHn8ydF
	gOJZhdnN5RybfCetgZrJyAVQNz3ci9XFWwc1lYjcnhPzzLvXkyQzhttXgM5VUmCmoPXIRML0PXD
	qX84eCQ+HxBPJF00VgqeJkDCxlv6HS7kOLU/FL0ZMNDqpFdqmfWDHVdJIHWeAN7JVVSPwdR5/I+
	HIbf4TNC52xJ0i
X-Received: by 2002:a05:620a:6602:b0:93c:2946:5702 with SMTP id af79cd13be357-93c47498f83mr2335278785a.39.1790656276841;
        Mon, 28 Sep 2026 21:31:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:93c:2946:5702 with SMTP id af79cd13be357-93c47498f83mr2335275185a.39.1790656276290;
        Mon, 28 Sep 2026 21:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debc01fbsm1024463e87.65.2026.09.28.21.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:31:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:31:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: Re: QCA: Update Bluetooth QCA2066 firmware
Message-ID: <jekh37skh7xth6rrbc3xcm4ie5ejk6he6m5h4xzj6rh3b3uzoz@hgbowasbor5x>
References: <70dcc907-c20a-43ae-8df3-af11c6e92ec5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70dcc907-c20a-43ae-8df3-af11c6e92ec5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyP8tvBxXbsV0
 IkleGrQcYEcb9eJVom5o4XNZKZnMUBu2IXXux9dCZ/M45ltod2/MP89gZQ+l8jf0gPGfLAf35oN
 rAu6vJJdcC/G+Jag3HpRzSYjdHoTk6E=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb3f15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=ciYAOYWupN1zQWma4X4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyO7B2iSyQBUM
 +SoEkilHtSv8MBpnszgTAQ3r9hBVyOajWpWFtkwEOjbi7/djut9AeGeutjOS7oDJenu2uIfkPZb
 C/3Nm1bHvrM55P9u3pervo1IJNHTLezWsB65fAL4XxuMzWOLhYxPI9rqhrVPWjCFzxRNX+Prfx6
 fx46oJKJocNhJ3nEskEEN3m8zXrnOKjos0r46PCdAaOXinf3jGpsz7mtCPDKWqlNGMCNuojcifD
 dlrqQDqj3uDIAF0zQJbNJgLbQxE/fU+c7s0fwytSxkwUWGx+2M5bvhdD65w9SKBSw/Fat0WWWds
 B6cBCGthXANKIcRg3qxMpvXTJkBxxpK0IIV8p1tAgEJ9Vx5AkkXo7NCmINfyOnbw2oOCa9PDPRU
 iOHEQBAHSPAsOwavXOcnQBufK4LHcx0h2jGnQymF1+sLMvU/13vlWTvk8bIHxccN1MgvXwxRUsB
 wcvQkiJz6Ul0KniN+yQ==
X-Proofpoint-GUID: Qt1uM7EvcStrppgkHYGlsyHPbBM0RhgE
X-Proofpoint-ORIG-GUID: Qt1uM7EvcStrppgkHYGlsyHPbBM0RhgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

On Tue, Sep 29, 2026 at 11:45:31AM +0800, Jinwang Li wrote:
> for you to fetch changes up to f830e56c110c727e8286eb1cebe18f6f1d9331f6:
> 
>   QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c (2026-09-29 11:26:40
> +0800)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1281

> 
> ----------------------------------------------------------------
> Jinwang Li (2):
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
>       QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c
> 

-- 
With best wishes
Dmitry
