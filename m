Return-Path: <SRS0=nxq1=2O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A489C87FC9
	for <linux-firmware@archiver.kernel.org>; Sat,  2 Aug 2025 10:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D68E7C4CEEF; Sat,  2 Aug 2025 10:45:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0EE1C4CEF6
	for <linux-firmware@kernel.org>; Sat,  2 Aug 2025 10:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0EE1C4CEF6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725exRa004350
	for <linux-firmware@kernel.org>; Sat, 2 Aug 2025 10:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynEOL5S0dz1I8aQQ/CHYNlR4NcILfdu4SeyGc+0Bpa0=; b=YGPL+61UEf1vypzw
	soBE0L/AQIrErsbJNlLBXDOIpuLOqKroJ6UbPbntMqqlJNDJU/tjE34FPcMCl94E
	a1E0FmEZhyelLnxx2uAOubFrL6oACAUvhK/IGSrW3znFI0NZngxTmrbpCBaGPSvv
	kpq9nH/SnzUGMLieqnsZMroWkCP3O71p6DvS4z/+vfj5cT4+bnUPFFzu+/61+T4g
	jwHaKrdYvsMnfjO3xMWfapsws4EnvcG7LfhN8UjWk+OClLApxgtBAEXd86Y2WEUX
	IFlCwek6f04HGtMvIvmSTOB5nin0fvc93D9cHFM7WZyjFw6inJjlm65OF5RrA1aw
	CKnfGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqghjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 10:45:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70747c020daso45834076d6.0
        for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 03:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754131537; x=1754736337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynEOL5S0dz1I8aQQ/CHYNlR4NcILfdu4SeyGc+0Bpa0=;
        b=EEKCBspLgS+zPGO3gDm7TwwHMWLr91WA+EPide30b+cFr4/HRc+mfQ38dFQqjN1tSl
         dayOQ2zq5wjVIJhJAGZaWTMpNlFsaBUqmq84b+v4VyR4CANp6aHkCxDKj6p64z+WaqKo
         vBhDgIQ4B2xADdEQhZUdM6xG1IhyjcHYR+ctHgURoTKSsD+075zKzGa5wXO47uwWZ95b
         dUKp3yPbVb+IV65EzREtHyk/uT4247MTqfFAlXhjSd/bOfHiYPz6J89uRtsvR7pOZ7gV
         oD4Y4mLZmJPSyLBEdhTGbprsUKqLTFigPexr+GkBabHGIZRd/ZtDcYa5Fw7sZVtdu/50
         0ItA==
X-Gm-Message-State: AOJu0YwsAk6AE1nch9ECoETcL6wx/+Ak0Tv9l+eusns3mqY4YrWbKpGt
	SJuL+GIucRIvbI+KHf+PFrI2gznyPkNg3xzGWAqp8TM7pBGRbIzMRg8r+5l1MUaEraQdId83HZL
	lyOnPFotpLHog7PJjYAZD+Db18bc7dvCdrExM7DJay/36V/PNNCrp924lNCX2gpo=
X-Gm-Gg: ASbGncsXk5JAPIW7x8fZ3cyLZdHzYbDA10qWuCokpqjvcmZ96DxAuQv1wEGvkc+7I+a
	juuIjj/cdRYXw1k9NI9ksHNcVe2HY16OvsagMaf5RKK8SJPi1jbg4WE+QO4NqIzpBhHU/ofAQXz
	++cN9QO0l4AFKedBxFlMvORdjRxvmMU8WCrvp+nSaME26UhH/86OrX+Y/wv30zk4DaIFxbI4azW
	wxKB4pfM0EmEiRTIxN4fd+2jHznehFVlYYfQXr6kA2reQ3mnLeq3gsP0NwVd6y9fGF5ARglkJqE
	GCqv6iQLk0a3ZDZiGrmdpoueG1uPb5x7HR6MCEh+0D5OApU7dCl8hWHy/R/r+BNgW1PNNIh0q/u
	V8CoWgi2yqk5gREH2N9OlAJ/+Yb6BvJNV4RBsiVkCvltRwK28TYG0
X-Received: by 2002:a05:6214:cc1:b0:706:f190:f2ec with SMTP id 6a1803df08f44-7077ced5eabmr131711146d6.19.1754131537259;
        Sat, 02 Aug 2025 03:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdg44QUv/AYq7uI6w1kPo5n0d4JILnatATwS+PDJVcd7iTNqIEwMC9F+U+SS6sQihLclICQ==
X-Received: by 2002:a05:6214:cc1:b0:706:f190:f2ec with SMTP id 6a1803df08f44-7077ced5eabmr131710876d6.19.1754131536775;
        Sat, 02 Aug 2025 03:45:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88db3b70sm921061e87.182.2025.08.02.03.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 03:45:35 -0700 (PDT)
Date: Sat, 2 Aug 2025 13:45:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PULL]: Add QDU100 firmware image files required for booting.
Message-ID: <vqbfvneyemeofyixydra43ylmd22bbcxdsxvd5bm4mb5z24rb5@rzmmo7ipxsur>
References: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
X-Proofpoint-GUID: hoaKl4SF18aJ2XTGiqMlIYWIeLa0SY7_
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=688dec52 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=qhmWlx60cTS3QomtLi8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4OSBTYWx0ZWRfX1CoZdv66uph4
 jjh1FbXuYOUo+Xg3AFLfPjeQzLe5p8QkGdWqh1Tc/8GRNAUy1qKuMvclLF+AZpRoVtmmk6EdiYC
 oL+63dVPoI+gSLb+UFqMq2sZoxftnCZ65q9f4F348i6laDqvxodb/WNWsS9tQ6JBJyG7GD/nd+u
 3KgNEGpJzOspdckB+pNQ59WBz33If7hjmIwIL4xiQelx2FB+QUrd0Eb+XYUmOcRI9b5o8zZSA/A
 RFMpZCokeZ1EF8QYU0ccrt/B+YNma5Xww2x9RO+PEPqofPuOAtFICaTd0UN8UcjLIvnxYXl7tGL
 eU6DcU0dRywtMKWHGmDcTVvWZMxYg5OQ5TEclcjsRx26zKclcp7ghjuCl6cjSXNClzPUj3YQXze
 18g3Zt6AfkIUL/p2pv3xfIXQmgKfaPSoN4JEqAfz2ew281lOuH57e8Jc2XODV7XxQ2y3/Ksy
X-Proofpoint-ORIG-GUID: hoaKl4SF18aJ2XTGiqMlIYWIeLa0SY7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020089

On Sat, Aug 02, 2025 at 03:51:11PM +0530, Kishore Batta wrote:
> The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:
> 
>   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22
> +0000)
> 
> are available in the Git repository at:
> 
> https://github.com/kishorebatta-ossqcom/linux-firmware.git qdu100_firmware
> 
> for you to fetch changes up to dcec874b15615bdde99acb9f2d39572eb14f4c24:
> 
>   qcom: Add QDU100 firmware image files required for booting. (2025-08-02
> 15:39:06 +0530)

Are these files required for each boot of the QDU100 device or are they
being programmed to the target and not required for consequent boots?

> 
> ----------------------------------------------------------------
> Kishore Batta (1):
>       qcom: Add QDU100 firmware image files required for booting.
> 
>  WHENCE                          |  21 +++++++++++++++++++++
>  qcom/qdu100/abl_userdebug.elf   | Bin 0 -> 212792 bytes
>  qcom/qdu100/aop.mbn             | Bin 0 -> 510944 bytes
>  qcom/qdu100/aop_devcfg.mbn      | Bin 0 -> 12136 bytes
>  qcom/qdu100/cpucp.elf           | Bin 0 -> 68576 bytes
>  qcom/qdu100/efs1.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/efs2.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/efs3.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 0 -> 20328 bytes
>  qcom/qdu100/hypvm.mbn           | Bin 0 -> 1358672 bytes
>  qcom/qdu100/kernel_boot.elf     | Bin 0 -> 49004344 bytes
>  qcom/qdu100/mdmddr.mbn          | Bin 0 -> 81960 bytes
>  qcom/qdu100/multi_image.mbn     | Bin 0 -> 12088 bytes
>  qcom/qdu100/multi_image_qti.mbn | Bin 0 -> 12088 bytes
>  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 0 -> 7992 bytes
>  qcom/qdu100/qupv3fw.elf         | Bin 0 -> 56432 bytes
>  qcom/qdu100/shrm.elf            | Bin 0 -> 82428 bytes
>  qcom/qdu100/tz.mbn              | Bin 0 -> 3186640 bytes
>  qcom/qdu100/uefi.elf            | Bin 0 -> 2666296 bytes
>  qcom/qdu100/xbl_config.elf      | Bin 0 -> 225368 bytes
>  qcom/qdu100/xbl_ramdump.elf     | Bin 0 -> 749464 bytes
>  qcom/qdu100/xbl_s.melf          | Bin 1424292 -> 1444772 bytes
>  qcom/qdu100/zeros_1sector.bin   | Bin 0 -> 512 bytes
>  23 files changed, 21 insertions(+)
>  create mode 100644 qcom/qdu100/abl_userdebug.elf
>  create mode 100644 qcom/qdu100/aop.mbn
>  create mode 100644 qcom/qdu100/aop_devcfg.mbn
>  create mode 100644 qcom/qdu100/cpucp.elf
>  create mode 100644 qcom/qdu100/efs1.bin
>  create mode 100644 qcom/qdu100/efs2.bin
>  create mode 100644 qcom/qdu100/efs3.bin
>  create mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>  create mode 100644 qcom/qdu100/hypvm.mbn
>  create mode 100644 qcom/qdu100/kernel_boot.elf
>  create mode 100644 qcom/qdu100/mdmddr.mbn
>  create mode 100644 qcom/qdu100/multi_image.mbn
>  create mode 100644 qcom/qdu100/multi_image_qti.mbn
>  create mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>  create mode 100644 qcom/qdu100/qupv3fw.elf
>  create mode 100644 qcom/qdu100/shrm.elf
>  create mode 100644 qcom/qdu100/tz.mbn
>  create mode 100644 qcom/qdu100/uefi.elf
>  create mode 100644 qcom/qdu100/xbl_config.elf
>  create mode 100644 qcom/qdu100/xbl_ramdump.elf
>  create mode 100644 qcom/qdu100/zeros_1sector.bin

-- 
With best wishes
Dmitry
