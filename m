Return-Path: <SRS0=3Ey0=S4=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD5DE6C5E5
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Dec 2024 02:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25021C4CED2; Tue,  3 Dec 2024 02:23:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D260EC4CED1;
	Tue,  3 Dec 2024 02:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D260EC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I7OjI025063;
	Tue, 3 Dec 2024 02:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTbXoaLSi7/88s3KW2rjE4nneUbcQg3yAFTbqYzv1JU=; b=AdyOt6ykWayMwLlC
	UHZTY+sqy0AZwYX0eeOhSVUcGSilRvpRkBU2AVchB6z/GHzpsl9j120SF84zXC4J
	xu9Q5GO/5PDM1kWArfokc+nnJVd5RwKretS/Qmlc4LIhj/GWn8Jd2E7alwbJVdOG
	5bNz3JCh6LRyPRB4w6+FaEwOkIV2Ztz6nfBnrqPBuYnIq+yZM7GJjX6//2ehj2ak
	GF2oNvwTuZD2QFlZis/WJXrFmYYxbIe/KYnqYRPVllAm0cTzZtqf/VdA5TlMKLnO
	dkFUqMIGs6I8YW0HSwYbVh9CeW9wdLCTh34/moI+ca8go1hqNxdgGYn7QqP/Tnuu
	3o1EIg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq66jg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 02:23:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32NYIU028868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 02:23:34 GMT
Received: from [10.253.34.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:23:33 -0800
Message-ID: <e2c2a813-1884-4fd8-873d-5445be472712@quicinc.com>
Date: Tue, 3 Dec 2024 10:23:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to
 2.0.0-00515-2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com>
 <cq2po7zw46nryv4lzdopfqv6dut632ax6c4ezcqbrf4w7qsdi3@cedllayr7nlb>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <cq2po7zw46nryv4lzdopfqv6dut632ax6c4ezcqbrf4w7qsdi3@cedllayr7nlb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6RCuscAd3dV8SVwGqLx6IYC4FEU4kGaw
X-Proofpoint-ORIG-GUID: 6RCuscAd3dV8SVwGqLx6IYC4FEU4kGaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=993
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030019

On 12/2/2024 6:17 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 05:31:32PM +0800, quic_zijuhu wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:
>>
>>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
>> +0000)
>>
>> are available in the git repository at:
>>
>>   https://github.com/zijun-hu/qca_btfw
>>
>> for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:
>>
>>   QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)
>>
>> ----------------------------------------------------------------
>> Zijun Hu (2):
>>       QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
>>       QCA: Add Bluetooth nvm files for WCN785x
> 
> Are new / updated files covered by LICENSE.QualcommAtheros_ath10k or by
> LICENSE.qcom?
> 

LICENSE.QualcommAtheros_ath10k as marked by WHENCE.

for firmware updates and adding NVMs for existing PATCH files, we would
like to follow existing licenses.

thank you.
