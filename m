Return-Path: <SRS0=tLei=VZ=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623EFC19F32
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 02:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26D78C4CEE7; Thu,  6 Mar 2025 02:44:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2109C4CED1;
	Thu,  6 Mar 2025 02:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2109C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525IUSub030803;
	Thu, 6 Mar 2025 02:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acDpad1BrFZoy6Uvkb5DRsEP7jlmtop9ndr1OlFzWLU=; b=nj/Pzs0mZ7IunMLt
	T0HdiIFTcmUVxCCGR9JFkWpLB0yxJencIlD7+ACy6sdkXeeJF4wkcOh7+oP+xSl9
	Adavv7qz+88ojX+ZwFkiLlQL2hN9FbYvs5frdW4Hl3ho0ZkTwBbtEB34IsIzzeZN
	s4Cqvu9X+pXOKSB4oEd3QJeeELS1Ybf/HTKDepKS7VZ9Bfizxc1Q7J66QNEI1VPP
	EiJUqk5M+kDWIdkCu4eSFw737uq8RGwVqZWKnPhLRD064LlnOQtm78HyzdZNHnYW
	XvAEOMO7H08Wm8wtLDK+0GqSx8tY0G70ehWROLb+uzKElUEls/LgH2Xhpn4hrO7B
	pANgBQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy093gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 02:44:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5262immG031546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 02:44:48 GMT
Received: from [10.133.33.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 18:44:46 -0800
Message-ID: <3e6bab41-9b70-4958-9d57-2b0640ac92ea@quicinc.com>
Date: Thu, 6 Mar 2025 10:44:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <01571886-3cfe-4aa7-baf7-d474ba093b6c@quicinc.com>
 <atz6kvfby5w6hpd74ik7bjkwrt53uzga666qdzzjdnum7nzk5t@yajr6l6y2zpt>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <atz6kvfby5w6hpd74ik7bjkwrt53uzga666qdzzjdnum7nzk5t@yajr6l6y2zpt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c90c20 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=wgDW5O--P2RYkc2csBEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uuY4HFAjCHkCBqL7eTEMU0it3hWqa9BB
X-Proofpoint-GUID: uuY4HFAjCHkCBqL7eTEMU0it3hWqa9BB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_01,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060018

On 3/6/2025 4:35 AM, Dmitry Baryshkov wrote:
> Hi Zijun,
> 
> On Wed, Mar 05, 2025 at 07:02:38PM +0800, Zijun Hu wrote:
>> Hi linux-firmware maintainers
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
>>
>>   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
>>
>> are available in the git repository at:
>>
>>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305
>>
>> for you to fetch changes up to 16906ee494a2c7c26477c29deaf1349b4c1751ed:
>>
>>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
>> (2025-03-05 18:16:33 +0800)
>>
>> ----------------------------------------------------------------
>> Zijun Hu (4):
>>       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
>>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
>>       QCA: Add two bluetooth firmware nvm files for QCA2066
>>       QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> It looks like you've largely missed updating the Version tags in the
> WHENCE file. Could you please fix that?

thank you Dmitry for pointing out my mistake.
let me update and send out a new pull request.

