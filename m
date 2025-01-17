Return-Path: <SRS0=kPBI=UJ=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD77C02183
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Jan 2025 08:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64CE2C4CEDF; Fri, 17 Jan 2025 08:57:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62219C4CEDD
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 08:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62219C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H37dVE026615
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 08:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4GU/5b75q5a1x2bn59fA9MCramjrV+wIueal/lzo8w=; b=Y7q2npR1K6q8WQ02
	lBwaF/EwHuqEWPpQJQzxtff7qGuCsirRElqBaqipGQ0Y/wKnQb0Vel6k7FWNc5Zn
	mlGtzLtHkdwoKxFL5pm31Ht3yUtl6Vaqzlj3niGerd9K4gSWintrzK69Rx0ecc9f
	rRStr5cOUPyWT3Vqfo+viE6Os/mV9mozjstA80mhMj5VBkxZVPa6F1u4738zfswy
	my0mYmYQMD+sIBWOlMkUMwqOp6NbdE8oO/UKS3ROFKJKgBOIE/4yw76wvoPU3sOq
	JHRjHAum+YCw2ss4WI6t6o/wGQTuSw4O6CBor0n4VWeeI0rzuDlrYbr6GnuoMmIf
	UUbbpw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447f1egr6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 08:57:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H8vb2S015379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 08:57:37 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 00:57:35 -0800
Message-ID: <bf08e319-07ae-4f96-92f2-aac8f1a7e136@quicinc.com>
Date: Fri, 17 Jan 2025 14:27:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Update firmware files for BT chip WCN6856
From: Vivek Sahu <quic_vivesahu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <quic_janathot@quicinc.com>, <quic_vivesahu@quicinc.com>
References: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
Content-Language: en-US
In-Reply-To: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YQqu8tPIPySF26FcPiY2zg1Gp0V0ZYLK
X-Proofpoint-GUID: YQqu8tPIPySF26FcPiY2zg1Gp0V0ZYLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxlogscore=921 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170070

Hi Team,

Any update on this ?

thanks,

Vivek K Sahu

On 1/13/2025 6:19 PM, Vivek Sahu wrote:
> Hi Team,
>
> Please include firmware bins for WCN6856.
>
> Major contributions : Bug Fixes/Stability.
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
> --------------------------------------------------------------------
> The following changes since commit 
> ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
> (2025-01-10 16:33:04 +0530)
>
> are available in the Git repository at:
>
> https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master
>
> for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
> (2025-01-10 16:33:04 +0530)
>
> ----------------------------------------------------------------
>
>
> Thanks and regards,
>
> Vivek K Sahu
>
