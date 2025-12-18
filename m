Return-Path: <SRS0=UWHt=6Y=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC25D6E2AF
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Dec 2025 16:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5419C116C6; Thu, 18 Dec 2025 16:31:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7D72C4CEFB
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 16:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7D72C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI93puv4057299
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 16:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeBCe7B0VcxDhC28VZgz2HDI2Id5i8jcGvj1CZvqqoY=; b=X3Qxg9YKtYwOdgkX
	s7Dr5uNKlDYLhJL98r43VarTg/0+73uwYckGwFtxh5OpDPac72PQEc+gQhj+bQrL
	Xcpqe/ydNCnSZcEMn+gtgc0G6pepcePITrkhEwljOm8ISXvFfXlMEgEdosd5Z7gH
	buXa4+ZntVjVj6rOFft9ZaY9NrPmviRxRRV7nVnW0yCiAvSVtD186f24a7WM4ROg
	5/kF0tt+g5yHtbp01JBk9BR6KlxNDOIH1h3/KyEN94jFSxGqOOKljfCTZ1b/Yy3d
	eNjiJyku9Vp1QfHx3GWow1FgCtQSUdLRVtfYSyyJ2OHoJqFhSiLjAsHN/CZ4IiTH
	mkUuSg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5caf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 16:31:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f550cdb2dso480798241.1
        for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 08:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766075486; x=1766680286; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SeBCe7B0VcxDhC28VZgz2HDI2Id5i8jcGvj1CZvqqoY=;
        b=MhVCME7eZIfrgQ+/LN8TtJH00hgcWUyOIyibqdms1hbwMlRt+8P6PvoO21TASFROQb
         5E+1u6y5h7rTRWFtsbd+kLcr9ILeds95YcnmiIc89wbv+sdXvZtSONsxXeFcIEXIIYi+
         41hE1WKo7lxN1PXV02dlSiWqrYCaFUlKEcGkUWhZRwklSSGKRixR0NIqQrj+2DHq0DeE
         n/jXoOZywmCY+wFMRT/YCZYpzxoRFNuGSK+OLIZYF9g8KTVDsM5jorPDwAGrDayIHtxH
         euHjk1R4mZEOL8I37Q31+56YSZiKSJACOk4kx57nJBJAmqwH6BYhmTfaCX0JG7euGqjc
         3p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075486; x=1766680286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeBCe7B0VcxDhC28VZgz2HDI2Id5i8jcGvj1CZvqqoY=;
        b=pwxfWj8hHss7f1jwlnEFmq+uZc6LlE+bzOM+MzHbf5AFU9re4HPVFGnGs9t35eSDyF
         louPQY0fErGA/1LEWzs5uyvHn09UGezLAQ0Cnm89A7i+EHZI8dPQfX3JCrN7/wpja8tZ
         VwVKdPR+DeuNueut5YZGxbB7fIM9HMBul27sO9OU0U5LnZrrVWWAm7dFAwKUZxrdMmIy
         dUyAwNnPD1XZ+IrRG+eYci2ZxvpGf2CGHwk4gKjEki1/aq8g9ck/zWBlBVA25gqqJpMH
         tLUwYRTbmowK8p224I/4rzf+iMuUGV5KctiOcJAK3ynfqZTe9ycqr3timx08XzfZPVpm
         BKjQ==
X-Gm-Message-State: AOJu0YxAg5CgYu0wNVDPx62AtqFQVefMrXcm+YL8RsXMa1WKgTq9yFg6
	ITuoSg2u2lSJyPPQTRtSgEd0uy24fH1ZZjca6f/Ccy6m+0UJBg4RIFJ3nDD1vbBiKqBxe6YjjS5
	+9clJX811doZbeTooxkQTt/iJOjQkjD8W/kIS8TLM6hF1IQ/lYG+afXM+ZMDrNMHUntEaANs=
X-Gm-Gg: AY/fxX5aaTfTCv7BFa87L77xzwzX9bn6RRXUtUETkadMNdX+2NTHKj6FTF8Z/RE3Jqt
	2lcPRY++ptYHbnH86DrddasYRZPW0ChX4+npM9ZV2MhASHXe4UpzICM9HsiGNfxwQIgEuOF60eW
	JPl/a84hJ07p9mQ0BiHXDimTZ5YCjlD10v69hSLf79N9UkuG+4MS/uYWXRqr4h2iAIEfzqNAxx/
	2HYE1ziPWZmZRvoKi2TSa40vs/oRbIXb7QtTb7Amch30ln4th2GTxy4NUi++WYI7+faKj0CsDxT
	F7l3dKx0nFcSF2S9Y5hICxcHW/zfeC/xiSS/OmuENJRH+Gb/Ue5K9MPjx8DB7EZ85yWdMOg3DbK
	WBMI0wBiWq7mYk7dIw4PBjR09QjUihxHrKhSgGaYupD1hiTFO8vob5eEsG0zGVtatFRuf5YhlLy
	a3H029agIz8PaMmTImF/OF1Eg=
X-Received: by 2002:a05:6102:dd2:b0:5db:23ce:3db with SMTP id ada2fe7eead31-5e8276a085dmr7512896137.11.1766075485516;
        Thu, 18 Dec 2025 08:31:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEijWupV5+wrmVUmG6HhVxr34PB+ZTFxc3MnhU903OSilJV2PocNDiGoTNrB6beX1hZmH+NrA==
X-Received: by 2002:a05:6102:dd2:b0:5db:23ce:3db with SMTP id ada2fe7eead31-5e8276a085dmr7512814137.11.1766075484979;
        Thu, 18 Dec 2025 08:31:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a134fe855sm1205967e87.74.2025.12.18.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:31:23 -0800 (PST)
Date: Thu, 18 Dec 2025 18:31:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PULL]: Revert QDU100 firmware binaries
Message-ID: <rt5k3ufrjpnaqfcomvapznnpg76xs3az3pz6d5reh5yldydvkk@irtjzqbfdbvs>
References: <deea8617-b699-4f48-80aa-69f78ccfe852@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deea8617-b699-4f48-80aa-69f78ccfe852@oss.qualcomm.com>
X-Proofpoint-GUID: pzBeqK_LqXEJSuwptrk8r_D7sESq7OjJ
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=69442c5e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=wx8N9PUghgKTF4WnqqMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzNyBTYWx0ZWRfXyLZQfKE8ij4A
 Z0+yslvIuM0PmJKzi2427ETt8lPk9I6jdLgEnPP9Y11qSz5Z6l53c544QWtztKzYaAKHNU7m33G
 K0DlvYcec94LCELpo1PqFs1WRgolkcVjCCJ3hvhpjCdL9ZN7t1W3OqpIv8CbOmo8hmO4xJ/4JUS
 JuwtynTbFfUmPR8G8/Fv8SuKLcfc/lnc8wvKMzBfwuGhSc7Q6CooD/MxSgYNKN/V1DLvcvHCkx0
 euTYcSpPXcnqHbBShhVD9dZcxsd514Xp4SxDj4INhsMfbWDjCcmPZA8CQMVni6E+u+2JBUH4b4V
 zUuOVlz+cCYCj0s69e6MZ6DDvOmHiTUOk09uBvrYMR1oHK1dlXWkKjJTtNMpCbPEXDjA2bunmel
 GL44PzpkfYqHvFEKQzvJzvtfJO3Ygw==
X-Proofpoint-ORIG-GUID: pzBeqK_LqXEJSuwptrk8r_D7sESq7OjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180137

On Thu, Dec 18, 2025 at 08:48:16PM +0530, Kishore Batta wrote:
> The following changes since commit e66d9269e773a553a99f7771982a4bef06c562ec:
> 
>   Merge branch 'robot/pr-0-1766039412' into 'main' (2025-12-18 13:28:40
> +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/kishorebatta-ossqcom/remove_qdu_firmware.git
> 
> for you to fetch changes up to 1b13c94137c81ae21d81065ac94c27e71c51bc96:
> 
>   [PULL] : Revert QDU100 firmware binaries. (2025-12-18 20:36:55 +0530)
> 
> ----------------------------------------------------------------
> Kishore Batta (1):
>       [PULL] : Revert QDU100 firmware binaries.

Why is [PULL] being a part of the commit message?

Also, more than a month ago, when it was submitted previously, I asked
for a list of the affected software. Are you saying that you are unable
to compile it?

Also, why are you mentioning some random NOTICE files? This is a licence
breach, it should be described and treated as such. Write a sensible
commit message.

> 
>  WHENCE                          |     22 -
>  qcom/NOTICE.txt                 | 268885 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-

What is this? Why are you touching a file which supposedly applies to
other firmware files?

>  qcom/qdu100/abl_userdebug.elf   |    Bin 212792 -> 0 bytes
>  qcom/qdu100/aop.mbn             |    Bin 510944 -> 0 bytes
>  qcom/qdu100/aop_devcfg.mbn      |    Bin 12136 -> 0 bytes
>  qcom/qdu100/cpucp.elf           |    Bin 68576 -> 0 bytes
>  qcom/qdu100/efs1.bin            |    Bin 512 -> 0 bytes
>  qcom/qdu100/efs2.bin            |    Bin 512 -> 0 bytes
>  qcom/qdu100/efs3.bin            |    Bin 512 -> 0 bytes
>  qcom/qdu100/fw_csm_gsi_3.0.elf  |    Bin 20328 -> 0 bytes
>  qcom/qdu100/hypvm.mbn           |    Bin 1358672 -> 0 bytes
>  qcom/qdu100/kernel_boot.elf     |    Bin 49004344 -> 0 bytes
>  qcom/qdu100/mdmddr.mbn          |    Bin 81960 -> 0 bytes
>  qcom/qdu100/multi_image.mbn     |    Bin 12088 -> 0 bytes
>  qcom/qdu100/multi_image_qti.mbn |    Bin 12088 -> 0 bytes
>  qcom/qdu100/qdsp6sw.mbn.xz      |    Bin 5589248 -> 0 bytes
>  qcom/qdu100/qdsp6sw_dtbs.elf    |    Bin 7992 -> 0 bytes
>  qcom/qdu100/qupv3fw.elf         |    Bin 56432 -> 0 bytes
>  qcom/qdu100/shrm.elf            |    Bin 82428 -> 0 bytes
>  qcom/qdu100/tz.mbn              |    Bin 3186640 -> 0 bytes
>  qcom/qdu100/uefi.elf            |    Bin 2666296 -> 0 bytes
>  qcom/qdu100/xbl_config.elf      |    Bin 225368 -> 0 bytes
>  qcom/qdu100/xbl_ramdump.elf     |    Bin 749464 -> 0 bytes
>  qcom/qdu100/zeros_1sector.bin   |    Bin 512 -> 0 bytes

Are all the files in the list affected by the Open Source Software
licence breach?

>  24 files changed, 268426 insertions(+), 481 deletions(-)
>  delete mode 100644 qcom/qdu100/abl_userdebug.elf
>  delete mode 100644 qcom/qdu100/aop.mbn
>  delete mode 100644 qcom/qdu100/aop_devcfg.mbn
>  delete mode 100644 qcom/qdu100/cpucp.elf
>  delete mode 100644 qcom/qdu100/efs1.bin
>  delete mode 100644 qcom/qdu100/efs2.bin
>  delete mode 100644 qcom/qdu100/efs3.bin
>  delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>  delete mode 100644 qcom/qdu100/hypvm.mbn
>  delete mode 100644 qcom/qdu100/kernel_boot.elf
>  delete mode 100644 qcom/qdu100/mdmddr.mbn
>  delete mode 100644 qcom/qdu100/multi_image.mbn
>  delete mode 100644 qcom/qdu100/multi_image_qti.mbn
>  delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
>  delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>  delete mode 100644 qcom/qdu100/qupv3fw.elf
>  delete mode 100644 qcom/qdu100/shrm.elf
>  delete mode 100644 qcom/qdu100/tz.mbn
>  delete mode 100644 qcom/qdu100/uefi.elf
>  delete mode 100644 qcom/qdu100/xbl_config.elf
>  delete mode 100644 qcom/qdu100/xbl_ramdump.elf
>  delete mode 100644 qcom/qdu100/zeros_1sector.bin
> 

-- 
With best wishes
Dmitry
