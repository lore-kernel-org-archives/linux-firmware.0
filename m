Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B708E606A31B
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V1Yuy+BJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg0q8mQe
Received: by smtp.kernel.org (Postfix)
	id B1F4E1F000CB; Wed, 21 Oct 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792578967;
	b=NIJLusKnzaezCQ4mxclQZ9eg5j2B/q+hMrFTxQySBshnfaqYrQzFrkF72rQ9SBR7h42D
	 zpihk0+tygvlUTnG5rsWG8bjimL5185vF3aHzjGCE0cVEeZ77ywYb+zAVQyvbNjPVhgwm
	 lUKIHooMyQsitJb8reXiBb3fNdBU31T1bzLOv8bvvyLrgZxV4bLjJUivyTwxlGEDbiYNg
	 hlNFZ3/yCKbkyqgf/rgpC0amVKlvpKHgoLWDLnC2Ek3hocVmF0psITdr/GqaIcEiF8JOS
	 Sg8ADQxDHMfdi3Kb2zpbrm7DwNSvSFiWynSpzpQQj7c7Y6RBMVe+++lpTDFpQSWYaRg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792578967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qv5JjlLe0GtvnYj1oGfdQu6HE8MxfIeGk3T+ZufWMro=;
	b=kQ6LPOebHh4nDMmPn3mHfGkAbT2r2DhhohmUl0jZoQwxK9Y0x/xxalOZ5RKzeX++9laD
	 FPVhIAUYje7Wz5ZN6cCroF9E+j+yq5LK98sMVFlzhKDCpbjZI05lA0AcYziI76lkUITb/
	 C3L6YD+bjaz66yAt9awiwTM11aerV+t4rXZF5tjumeYODS1LcZwZ8NGqaloxYA3wEBAHj
	 Y7mfLz2pQ2OgIJWajpwynhcfND4wbYuKMN2NDP2bKVcUFB1SP0Tm2tLRNZXUxPdhYGnj0
	 ctFPgh9Lswtaqx+AUS3f53kOyTzWofZygGV3ISPVttExMZ+FvfAlhBUVgphlEXqPlMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V1Yuy+BJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg0q8mQe;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08C221F000C9
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V1Yuy+BJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg0q8mQe
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 08C221F000C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jTF3449613
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qv5JjlLe0GtvnYj1oGfdQu
	6HE8MxfIeGk3T+ZufWMro=; b=V1Yuy+BJpzVDz1R/lAlOAi2/Bd5pBgMl8gHUKu
	tsW3kaiBx5dhoCzlX44OnjlabntMSo9KZkciqbfcq7d6nFcqDEZMDswuLgUBF49w
	dTT1n0IBXOL/d6KrE3AQ8omSgKRKgQikl82pq3uSoIN8Kg3WmdQftZigrYBBaVbb
	2cyRxDbz46tbVLXBUxYdD20v5t0U3EmTQb9goVn0Ao8woCGgA0q1Eox7rbOW/0dZ
	uQYgS12deU0b904jMAaZp60JYQHr8eWVGaVVPR5ncuRBvYfslzjyzvp0QxvzAN0w
	OySjLQX3z0PKUuwOvZ0XS9P8LI6AwZ2ZSDtz6XTJcgLR/oGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ba7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 10:36:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535066512b0so19480841cf.0
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578965; x=1793183765; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qv5JjlLe0GtvnYj1oGfdQu6HE8MxfIeGk3T+ZufWMro=;
        b=fg0q8mQe7CJ6OXXa0WB39WoA4dYDjuEU6OK57mntQDwFu9S9H/6dBabSJWGnkPgJk+
         R/wvfELqRhrMNVVziJZZZA2coFfR92r7l1UpBJh0kwuE/Aa/WZTaEbmByhHnyMxLcoS0
         Mvj4TTI0V43Crpn1RN0JVDxtetGj93YJ3pXc1lWm1Y/bgF6X03ABYcNigPlccswFaIKV
         RLGAakCgE4zJf5c6TPx8ahtveuzkQ3vH7L4KVjVwnlAHn5EaAxJWVUICyXG2NjadTlGS
         ga0i3pnhewSjvgS+xzTnBABLSfV4PQ0KaG7B2LdRTyt8FR61z4pQFYdiyTulzkxTKLVo
         adOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578965; x=1793183765;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qv5JjlLe0GtvnYj1oGfdQu6HE8MxfIeGk3T+ZufWMro=;
        b=1xyVVNeenNQEZF7W++eTLojaYxdFVMSFXnSxs2T448c5XmfnwKQa3f/PFjHAOIwCi5
         VZeybOQFarnssQM7fjIEGtoqTeo6ipF8gqIUrP+u20wGsBqq+asejcPJl+qofVX7cBaE
         10eyE61cNFfJVFxRYZ/g3wMMQ99UeVK+7XR8Zy8qcyCXlVQp2+NKkGp264R9PHja83d9
         lN9YQxJjweGm+eb2nrYq+V1fOnakUU7+zhwYvMRMT/HEdKbhkJmbhFcfd76hmxawa6oE
         YcF+A0sN1IlF/kAbH8m/H+ltZxM9bQLKv/yDAf9Fxywa+KWuU4WKPkO5QWef1E9WaN1b
         uFcQ==
X-Gm-Message-State: AFq9FYIFKv6Hw8pUTkSjuUf+DeDTPYp7zDsynnDEmDLwXPS5X2lo7Qv0
	DPJZM3VzdzOxnHB5ScptnDZFmHLJXqdyFRruAX0mJOFPlZxjpWztjc19Om3oe4P6qPwmZ93AgWX
	a0JLZ388UnKpPm0jzsNDAs6DSTwTkXjw4W0aAGxxj2O5/8o557tdTfSHq+fks9SSEnHpZZz8=
X-Gm-Gg: AYBFou1JdKGRnu0AFOmEJZCS93oxsvhmpdI/RbGqOxOlO7s9VjBMdBvjO9ecwffQ23K
	q0DT22vEoj/IK39oE5gQYZKlhKHNUa3lZdjOpHkNahrqxKxPz+dzL7+QUk7GOfvr9Ah0FSCBvje
	KNCKT6wI1uu4dVb1bDGKJj/EtZ0bfFwGiddnHiupi3burwxqB21+PEFyBHLfC4i7xUFANiIFovD
	rJE/t4bSWam2khqVZ0j9fW3RONKilO9sTwUC3MEbszLAq0R3erT9aLtWUCvL0fOpfhA+VtbBr8A
	1erUfU7/AoQvz/PbshA5UTYdAUvZ4fgiuUTH0VQlQ4x3FpHa7yj9Q+r7mSIsu8PD9EEkY5Pa27n
	GVG8LxcEn/sxtQqL7qXFRzAIfA7XrkwkdJ5KyDPKysflzBaZLgpbAxlLX774=
X-Received: by 2002:a05:622a:c82:b0:536:54a4:da1b with SMTP id d75a77b69052e-5369b673a31mr22857761cf.19.1792578965026;
        Wed, 21 Oct 2026 03:36:05 -0700 (PDT)
X-Received: by 2002:a05:622a:c82:b0:536:54a4:da1b with SMTP id d75a77b69052e-5369b673a31mr22857051cf.19.1792578963992;
        Wed, 21 Oct 2026 03:36:03 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10ba4202sm21625306d6.18.2026.10.21.03.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:36:03 -0700 (PDT)
Message-ID: <7849e6c2-9524-4e74-8800-0fce2c60705f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 18:35:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
Subject: QCA: Update Bluetooth QCA2066 firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX+wdWdfZCdhsg
 TD88IDJRMBEPzWX5RZkuecgXCCGcZPlBFXngksLZrF3lqvLxc/29bcucjdxKQRad3APuQ9Cb+1x
 /hoP4rlwULYlV3OZXQYd+3JvbzulJ+U=
X-Proofpoint-GUID: OMM9otTRODHsNpeq_VmIFRhTM_tfIjPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX7SOWOoyg57zt
 sOw+CpeT9MprvbWM9MOXipTrpQJn6DouRwO9ogyGDE64xu1+3dLaD1CgqPlFvlWNHkiTOTu3+5I
 iL/89uV92tyvYOhB8ykkPzXxYpP1UwV27tgPPub9+qWOioNEJ8I26/akf3tsuIAqDEbGZSHGN83
 StixxiqHnjaMFRS8lspSWAUx4+cMQXCtWDGLERDFfa+e5Tn2GapxPvLEyzmlXl14biiEZkqv74D
 HdxrlS9nU3nq/HLI/RjZ7u/WmUPScoi6fd8cLpbZHubRs1o9aKbQl1MEQvNF9O1dKhrW9m5ZGyV
 PTwn/yK2dCJDGlRdA3OXtRt6JKq4nr9HyMTbgt8x+V/XzZ4IdPY8q3xqHduD+GYLeGbYa0++ByL
 6PUwXw18twPO7RPz/t7+Q5VBLvz4/HqugBSNtVlS11iHRE4ZJltppU6/JT5J4CF39Y1rfQGvTnI
 xCZN0BMCAjDBTZk7OXw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad89595 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=p_OvXnUqgSn1RLh1gp8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OMM9otTRODHsNpeq_VmIFRhTM_tfIjPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit 9a80a04181713da7f8187ec928c15160137f3262:

   Merge branch 'robot/patch-0-1792477420' into 'main' (2026-10-20 
12:07:53 +0000)

are available in the Git repository at:

   https://github.com/jinwli-qc/linux-firmware.git update_QCA2066

for you to fetch changes up to 7fcdd92bd8c7d2a57500702609059ffe03407743:

   QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680 (2026-10-21 
18:22:48 +0800)

----------------------------------------------------------------
Jinwang Li (1):
       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680

  WHENCE                                   |   4 ++--
  qca/QCA2066/nvm_usb_00130201_030a.bin    | Bin 6917 -> 6917 bytes
  qca/QCA2066/nvm_usb_00130201_gf_030a.bin | Bin 6749 -> 6749 bytes
  qca/QCA2066/rampatch_usb_00130201.bin    | Bin 160124 -> 163332 bytes
  4 files changed, 2 insertions(+), 2 deletions(-)

Thanks,
Jinwang
