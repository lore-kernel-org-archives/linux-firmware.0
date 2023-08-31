Return-Path: <SRS0=Fw8B=EQ=quicinc.com=quic_tjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C4C83F01
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 09:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B03E8C433C9; Thu, 31 Aug 2023 09:46:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C03ABC433C7
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C03ABC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37V9GDJ1023572
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 09:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=0yVVwO2BF3S8KM0iK86qpoGtml4ZVBaSol2I68xsubg=;
 b=mQazdHzxo93s+PVrmqCNzUKLlfC5b95t6PprbixZ3LeBtA/z+RyxMcHogFaBJ4p56HWI
 2c46GpTSVIn7ULMIlznZTDsYWWoCvHFFF6eOWF7cgEXGUne0zoQa5YHzKZWvhfRiQTnh
 Q8cbiaJkTJLfiobQ3h+42aIVjsCxd+lNVoILDOxiJQWzmWbhCP98+9+TJEvbV//942hi
 /IuEn/NzC7BUc6zASuporth/5Nc3V42pcFa260tVAEPgqQUdSV6ZVnjM352pTHkam5gt
 Fc2mtpBedAgC0/Vjh/5szqC/9YKR0i+o/WPOjqGsRaPPWulCCgYnuRzXjSxXlKpmkZ+L 0g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stj378qr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 09:46:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37V9kZ2w001822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 09:46:35 GMT
Received: from [10.239.104.229] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 02:46:34 -0700
Message-ID: <91fea221-6ff9-6850-7d4c-5ecfa2b8a3c6@quicinc.com>
Date: Thu, 31 Aug 2023 17:46:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Tim Jiang <quic_tjiang@quicinc.com>
Subject: btqca firmware 20230831
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B6thxsh1EoOCHMlRTGTA8G4KWU6MaAuC
X-Proofpoint-ORIG-GUID: B6thxsh1EoOCHMlRTGTA8G4KWU6MaAuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_07,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 mlxlogscore=629 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310086

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
5ebb5914a3b95be1dab4f058d073bd75afcdd0f2:

    Merge branch 'mlimonci/update-ci' into 'main'


are available in the Git repository at:

    https://github.com/tjiang1234/btfw-wcn6855-605

for you to fetch changes up to 1edd2d6faa066928f0ef7594ffc2a13d9888ea85:

----------------------------------------------------------------

         QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00605

