Return-Path: <SRS0=bkY5=GY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8702CC61DD3
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 12:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FC391F00A3E; Mon, 31 Aug 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788179371;
	b=ql/sYmM3N3mf7fXFI4uAn43LiZqV3IrBtfJtcym0j9L9U9TGqUOgrmkynrJ/Got9bjGs
	 FlHJFpVwT3uveQTCumWeCYdpVuqSrmo80zqqK2F/bDKJrW1W+zhKiAK+pCIBKpfKnJX8O
	 dq9EEeqAQN1UOmyjv3ccrC5muYfhIHazKp7HmvXdDCycdZ4tp4RQrTBZVO3+hXoN4CpQl
	 T1EkSuge5JjhW8zJ/y2t8nDhJdBK+3sGQdvmgaL6R0DamHa+HfpgcHW/qbgXhs6zbDFPt
	 Y+1G/IKJamlGU//V5yPHTnaIxs2sGMzxo2uoPBnHyncNgR0MYlfWvFQBV4k0JlJCZfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788179371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rIx7W6W4ULQvUA0L5SQSLS2/RzZS3dPPzLpfo0884G8=;
	b=gSGIJPL75cHUhr5S+mHLrNzCIPsctILvS8Yh1hgv8cHC8GWsr45OgwTFKkqWke5I31iB
	 QlzV5ykh8q6l4I57v+mu02jzlwYw/rJ3xwUaM/EHwaHW4gcd/q/03dU+kNqDM2btg/n0Z
	 iSSxaXPFStcyJPAARNK+cvfYJHpzQ3Fge7m184DU0O7tNB5diqzqb8TJ+ySRttG2WR4Kd
	 aX1Xi8b5Rg4Mn1SKqc83fM/8mYCNJxEm8GLOauM6jeQMqY2E6hoa0ir9rOm+APYGG8RNK
	 Uch3kn+Ud14ng3NCvMWBzcOMhWOrnmgQK4Vgk8IqOBvTH5f2w1d4nnL+qhzzC/h1U4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P4Qo3Svj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKJbPLlU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD1C91F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P4Qo3Svj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKJbPLlU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD1C91F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA7Fr3517859
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rIx7W6W4ULQvUA0L5SQSLS2/RzZS3dPPzLpfo0884G8=; b=P4Qo3Svj4yXeUWRy
	Dzo+CS1mNA28qCTVgnSMOb3ILlXLzG6Vu9s3YCJgZbCq7vGo6UyVr+W+ejNHvC9k
	lOFH7UcgnLoTWWfAVBGclwhDcSASzJUnu3oEFxC0y+7o93I0zwMCGlhiTAyDdx5Z
	SlkzZY31xpf9Rftl4im1RalaNHjGW604XsFC4quTnDwjYL29570kx3v35okLf4gN
	2RNc0lBrVrh33VTlYsMaRtE4g6pC8cUafUYhmM/NxgH3ECT4RS0BQtx5lVHLI1fT
	gJ3AAXcDnSCpEDkU18M1DzFvbz3MeMMQt641F6vvs6EWgQrgE6YXuhjrEwD6v1p/
	b8bYrg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90t03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:29:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78481f4ba52so3506186137.2
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788179362; x=1788784162; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIx7W6W4ULQvUA0L5SQSLS2/RzZS3dPPzLpfo0884G8=;
        b=AKJbPLlUaXB/+yBh82F3DeOn7CDDYeUMQRa42cZYU9KPNQkEkPSz+/7qMxOeJnx08G
         l4r3F4S7j5yBDnWkg7smX4BSw0guHeAXPG9BTjz9PkswVn0XezMrhkOQQuKxSPwiWCDS
         0ripTN4XrU5PMyxTnPWaPkmLu4wrTGuflcY5qjWKzG7kNV5NXYMo4/EU9/U1OQUj4T9e
         4xNz7Qk9xoJBD2HjPlmNj8oGP/0sdbQmXYjTFD4vLxx0utrx6QTEr0jyP20T2E7Pn5EX
         8ePHPdMHsh9djxokCMppIrdyVYwpJTD5/Rm+laOuuk/+PbnIu2YtSmG2LTAKgbuwi9to
         RTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179362; x=1788784162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rIx7W6W4ULQvUA0L5SQSLS2/RzZS3dPPzLpfo0884G8=;
        b=kwTiw0T/JfYmd/VnbAbs7XY+2Swepfu1byTuDLXPJUxSH0tD4MQW0t6EEymgbqdhqM
         MLiIvEyj3uqqafMkngGNCsESHL9uUG0bV1M+bWjre8V4smDhnaHofaiD3ij5Ab2wFG+/
         TA22gyC0mUfGcdsgNb6PsUQ2ZpNqGWQIowcX+OV4fnS3FqMtzw6JQDZZ9HX4js00Djya
         RW/sQQIZ1lC1Bzf9a2o+PvhU1O53v1yipTU6I9ZMhLHnNC+ND99abA23Pml8Evm9Xoip
         wRHYbYtskRNjFOEYlQzE/XeFVe3sopI2oT9RTkTXeoF3Ic2Xjf77hAmpy1ZIdmeqNIB7
         If7Q==
X-Gm-Message-State: AFuF++nrSiGlz7FG92GXEYnZVHkSMCgIpSnRYAl+lptfup58T3QYHLDp
	+CkE1+dbCFm6M08HWrzg9GeR9Cjl02ydJpA20IgXeGUzOYu/CltOkjPAtlF6mLaeBKrt+rSj2K4
	8fygv2YCMYQGMW3QzBs8pesod93rIaMe+PJe+OOJ8hHTuSE/tQ2+ArzvP4cF764g=
X-Gm-Gg: AR+sD10rwACz6oUfpGtvqFz15/i56h1PDbI5iGXlFY1ZpLuILYABi9dtWKW5zHkkDMY
	Qj12eSPMN3Iy/Ezdlc9L+00v7+clQoi0JWQNBUNWD16QK4hKf2KBFaybh69epRcF1JYDz6TIXKe
	mkYdP4avkGUDYnCVkR+8LX+9Q+oQnC9PFmuPIvEDFP1EljzcKby5LMpoqCFqyzydAybFkWZCXXE
	zIBzK6FkSji+oJO4isftpQVNznanOMQ5EggG+Hm62CvFfWdZFTIKPe4kyrxyAjhpH6OHqHXMomz
	kfpxp0NsdZSJeCaJwRjGMu3UT5HKFPGTH++YwJvXECqTlPr1AeWihOjuxxJmV+QF93qQnkQFNwK
	wx9Wwbr8GDoJW42ljjktkYJZrE9XyAiiN33xjJrEOasImRjZlsvMnJEzVLiHgeCkt8eXwhLrkG/
	fcaV7Mwnf5tVw+
X-Received: by 2002:a05:6102:3c86:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-789fc12eac7mr299999137.3.1788179362627;
        Mon, 31 Aug 2026 05:29:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3c86:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-789fc12eac7mr299968137.3.1788179362185;
        Mon, 31 Aug 2026 05:29:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce86sm2119995e87.62.2026.08.31.05.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:29:21 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:29:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Message-ID: <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a9573a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=Vc_to04IFQ7XAoiNsIsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: i92dRcrRLl04zjaMtSxuxydA1zxTPXfq
X-Proofpoint-GUID: i92dRcrRLl04zjaMtSxuxydA1zxTPXfq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNyBTYWx0ZWRfX49dxAj2gcSIY
 98S3GhxKt4IvVvOt3Q7iMKbmj2Nm+n8I33NNHlzu6UFlgb6iNmLAnffHyclP2M+pSrr9lfrhJ/e
 IyIwdQTICGPJoQ7nY/uPZwRF9YT/pms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNyBTYWx0ZWRfX6Ohchw+gDQJu
 4kT5pMTVSrnYVMQZgLIu5K+XdGxGjDRH9aJXEjcebeKXNUczLdWmqZgOsvz35QR9n3jTaThkYvd
 y65nphsO3rSkkiolyH7LH21xGzr7w6NQ3CtfPmTCtHr+Yd8YSky7tGA7bPa9NwWP/AS9xdU3NFl
 jS5NpLP15v58iqd8ikGQvYmh+N96FuYFeA2ILhdZ3YFjoQA3iwXH5KueyP4Okqw7t01KWIhun78
 JJQN1jCMvULWjGPk3yveitMQ+CgESwtBqBIErRrYDEbcq2HodrOuejspdG6NCWvBr5stVSmK6xX
 sswz6AyRYmxjclNpQ0IKwgXknzR6Rnb3nqekWv5z+ZF0+IwxL53wkpF6M1F3v9/ZiT7KXJjFIFE
 H6aKsWP94Z2LE2eS0DvKo3LRnnIcjG/fGAn5VtTvSFKi75ejcBMP28deTNilD8XF1qlKvO2FC9C
 GE5wJMGYVQLPvkah85g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310107

On Mon, Aug 31, 2026 at 05:38:44PM +0800, Shuai Zhang wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btfw. Please let me know if you have any problems.
> 
> The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:
> 
>   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
> 
> for you to fetch changes up to c13c658e2b8bb1fd0d4fb1181461a0b38fa1d4c5:
> 
>   QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-08-31 17:31:54
> +0800)

Please test your PRs before submitting:

E: qca/hpnv21g.30c not listed in WHENCE


-- 
With best wishes
Dmitry
