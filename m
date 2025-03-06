Return-Path: <SRS0=tLei=VZ=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE42C282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 07:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06B27C4CEE5; Thu,  6 Mar 2025 07:17:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B3BBC4CEE4;
	Thu,  6 Mar 2025 07:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B3BBC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LVxsu023662;
	Thu, 6 Mar 2025 07:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRE3lW5PMF345R499tztBqAuQtzeabGMqOlyWrAoFk0=; b=Pk/+/WJSP5/4sGcV
	z0+ULkUQJGxz1xNXceN0jsyYa4jZqxhIicduWNH9LGmuQaZJvUTx6AjwaqWqEyBa
	7L2Yex7J+Jt42L5FyAykmu6U5g2UE/NOc6IpcGqWb3rnwS5sEPcMGSao7eJERrx/
	N/Utv337EqbUBaZryfLYfOQMJFAU1FMLeJzN1URodAX7Y/YPwsqaBXnnKI3Gmf2A
	WRkpCAhdJtlC7HIUg6eYuymnY1GUL4K8hCcYxBTTEGwEEhkct3K8LqQZj51yinER
	ASyURRtQ0bUU1RhW/GV9aRSmNp8xQ+lJtUY3JFhmlICxTn0duCJCbsSa2WMkuVtX
	HqTLeg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t85f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 07:17:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5267HQaZ020568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 07:17:26 GMT
Received: from [10.133.33.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 23:17:25 -0800
Message-ID: <770a29f7-74df-4233-b3b4-8c83e910cc90@quicinc.com>
Date: Thu, 6 Mar 2025 15:17:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
 <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
 <83952440-70ce-4dfd-9991-bfb8b37683e0@quicinc.com>
 <jdhvuzryhd5ut4gzjv4s526gehbkjjvv573d45rhbosrcayf5e@nk34n5sb6xgu>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <jdhvuzryhd5ut4gzjv4s526gehbkjjvv573d45rhbosrcayf5e@nk34n5sb6xgu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c94c07 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=PIlMrf6FSMckzMoqSu8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: r51wnVkK8aFyB0YZZ5pLIUZWyOi3Lhuz
X-Proofpoint-ORIG-GUID: r51wnVkK8aFyB0YZZ5pLIUZWyOi3Lhuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=920 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060053

On 3/6/2025 2:42 PM, Dmitry Baryshkov wrote:
>> Are there any formal link or Docs about which one is better or have
>> description about file and version?
> Most of the entries use the option A
> 
>>> please fix the order of fields in the WHENCE file?
>> that may be another topic, may need a dedicated thread and patch to fix it.
> I meant, in your patches, of course.

Change
+Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+File: qca/CE/rampatch_usb_00130201.bin
+File: qca/CE/nvm_usb_00130201_030a.bin
+File: qca/CE/nvm_usb_00130201_gf_030a.bin

To
+File: qca/CE/rampatch_usb_00130201.bin
+Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+File: qca/CE/nvm_usb_00130201_030a.bin
+File: qca/CE/nvm_usb_00130201_gf_030a.bin


Right ?
