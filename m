Return-Path: <SRS0=GnVO=UN=quicinc.com=quic_chejiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86DC02181
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jan 2025 02:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AE61C4CEDD; Tue, 21 Jan 2025 02:39:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7CFEC4CEE3;
	Tue, 21 Jan 2025 02:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7CFEC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1tLaM006011;
	Tue, 21 Jan 2025 02:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXO1/80mZ1H9SaCi5NqeVOZAF68SPdWdZ6QOJNU7418=; b=EKvQZK6fn7xn6fsO
	lNaNDeV3tggawWxupC/bTsBzJExZx2P7fIOk7liBN959u5l37nAI5RwQb+R/lUF4
	qf+d0NvRz3pZim8VEYArh4pp35qL1mKuQqrb4qqckmEhyJ1aIGjvald1S+M8Yn4R
	Kbep1nURZcKusmOC3Izw5OBqK+RPxhJ3n8JVj2kHv9+169Ey7U514DZoBawYVdum
	sWojX5CNS1BYvZA6ImbaVGVmGrUHlSI55lAUbUd1v/ee3/WTdfuNjU1JKbTjHfau
	C9wBCq7V7qlvbkCnBoZ/QHvsSBVtqD0fHP+MnF/ImJ+ep0tUD23yhkiDVB2svz2D
	vfDHiw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2b802mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 02:39:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L2dVFh002904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 02:39:31 GMT
Received: from [10.253.78.203] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 18:39:29 -0800
Message-ID: <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
Date: Tue, 21 Jan 2025 10:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 81RcdME38EievfVrcg1SxCIeIZcCq3Up
X-Proofpoint-ORIG-GUID: 81RcdME38EievfVrcg1SxCIeIZcCq3Up
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_01,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210019

Hi Dmitry,

On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
>> Hi linux-firmware maintainers,
>>  
>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
>>  
>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
>>  
>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
>>  
>> are available in the git repository at:
>>  
>>   https://github.com/che-jiang/qca_btfw
>>  
>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
>>  
>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
>>  
>> ----------------------------------------------------------------
>>  Cheng Jiang (1):
>>
>>     QCA: Add Bluetooth firmware for QCA6698
>>
>>     This commit will add required Bluetooth firmware files for QCA6698
>>     The image version is 2.1.2-00035.
> 
> Please confirm whether these files should be using LICENSE.qcom or
> LICENSE.QualcommAtheros_ath10k?
Thank you for review this, it should be LICENSE.qcom. 
> 
> Also please include into the commit message an explanation that was
> shared together with the kernel patches so that nobody is surprised by
> the subdir and the firmware names.
Ack.
> 
> 
>>
>>     hpbtfw21.tlv : RAM FW dump
>>     hpnv21.b206  : NVM dump
>>     hpnv21.b207  : NVM dump
> 
> Which platforms are these two files for?
Currently there are two connectivity boards using QCA6698, the board id
are 206 and 207 respectively. So add two board specific nvm files here. 
> 
>>     hpnv21.bin   : NVM dump
>>
> 

