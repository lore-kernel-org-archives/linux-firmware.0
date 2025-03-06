Return-Path: <SRS0=tLei=VZ=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396D8C282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 05:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08D1BC4CEE9; Thu,  6 Mar 2025 05:35:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09671C4CEE4;
	Thu,  6 Mar 2025 05:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09671C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525KXOCH003372;
	Thu, 6 Mar 2025 05:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO6GXX5jgNiAyjDDDOYbEZ+8YeIKM4knpvwMPUm5Csc=; b=Mu0l2wBuXQ1mC+QM
	Xi5HqS82UWPkTwyBNn1MtX9EYRLTexjlDKQ8hNXl3zDnO6u678/N+qEoDBzyxhgY
	NSSU1HzR7mLMhW8o64AAar16NrMQMl/Ib8cgKP5l+LbldWKMFsgwJYY/mfT/yZY/
	DW46DZ4m2N+Qsidp3qtxt9X8o36oIHKC5j0q5yx45fuVL5GXaXIwM//MLtnEtxj4
	d0e9ElbsfCZ7hz0J6KuJXQaFT/SEvHfzwdHOTlhcsDeUDCseuwiNlz9+sC0xFjK9
	Kg2lq2GhPUqWGOERQJizDiv+zii6ZCbSVOgHJDkZl5Xl/LxqrOReAP8OlZ7FMKmm
	iUcFEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456wrj92ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 05:35:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5265ZkPv023940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 05:35:48 GMT
Received: from [10.133.33.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 21:35:45 -0800
Message-ID: <83952440-70ce-4dfd-9991-bfb8b37683e0@quicinc.com>
Date: Thu, 6 Mar 2025 13:35:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
 <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0nKQK1Q0wJqKt2VCARbzXQY-dyy-gjKC
X-Authority-Analysis: v=2.4 cv=FYDNxI+6 c=1 sm=1 tr=0 ts=67c93434 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=_QU4Ed29V7COXSV9hFYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0nKQK1Q0wJqKt2VCARbzXQY-dyy-gjKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxlogscore=994 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060039

On 3/6/2025 1:10 PM, Dmitry Baryshkov wrote:
>>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305-1
>>
>> for you to fetch changes up to b011c42ad704a6fe03c38793972e9b48057ed1aa:
>>
>>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
>> (2025-03-06 11:15:39 +0800)
> Version: tag should come before the relevant File: tags. Could you

i find that WHENCE have below both styles currently.
A)
File: file_1
File: file_2
Version: version_1_2

B)
Version: version_1_2
File: file_1
File: file_2

Are there any formal link or Docs about which one is better or have
description about file and version?

> please fix the order of fields in the WHENCE file?
that may be another topic, may need a dedicated thread and patch to fix it.

