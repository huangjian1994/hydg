package com.htcf.entity;

/**
 * 船舶档案信息
 * @author  hj on 2017-10-16.
 */
public class BoatRecord {
    private String id;//消息类型
    private String imoNo;//IMO编号
    private String mmsi;//MMSI
    private String shipNo;//ShipNO	船舶编号
    private String shipId;
    private String registrationNo;
    private String initialregistrationNo;//初始登记号
    private String shipsurveyNo;//船检登记号
    private String cardbook;//Cardbook	牌薄号
    private String icNo;//ICNO	IC卡号
    private String callsign;//船舶呼号
    private String localName;//本地船名
    private String shipNameEn;//英文船名
    private String formerName1;//曾用名1
    private String formerName2;//曾用名2
    private String formerName3;//曾用名3
    private String statusCode;//船舶状态
    private String shiptypeCode;//船舶类型
    private String flagCode;//国籍
    private String registrationPort;//船籍港
    private String inlandshipMark;//船舶性质
    private String buildDate;//建成日期
    private String shipyard;//造船厂
    private String owner;//船舶所有人
    private String contactNO;//联系人电话
    private String operator;//船舶经营人
    private String classificationCode;//船级社
    private String maxSpeed;//最大航速
    private String loa;//船舶长度
    private String lbp;//垂直间长
    private String depth;//船舶型深
    private String bm;//船舶型宽
    private String draught;//夏季满载吃水
    private String height;//船舶高度
    private String gross;//总吨
    private String net;//净吨
    private String dWT;//载重吨
    private String holds;//各货舱容积
    private String hatch;//货舱数及总容积
    private String minFreeboard;//最小干舷
    private String windLoading;//核定抗风等级
    private String slot;//箱位
    private String carport;//车位
    private String passengerSpaces;//客位
    private String minSafeManningNO;//最低安全配员数
    private String maxSurvivalEquipmentNO;//救生设备最大数
    private String hullMaterialCode;//船体材料
    private String propellerType;//推进器种类
    private String power;//主机功率
    private String rpm;//主机转速
    private String buildPlace;//主机制造厂
    private String powerType;//主机型式
    private String powerNO;//主机数量
    private String powerBoreNO;//主机缸数
    private String cylinderBore;//主机缸径
    private String powerItinerary;//主机行程
    private String decks;//甲板层数
    private String ballast;
    private String auxiliaryPower;
    private String powerClass;
    private String dataSource;
    private String lastupdateTime;
    private String deleteFlag;
    private String rowVer;



    /*-------------------------------------------------------------*/

    @Override
    public String toString() {
        return "BoatRecord{" +
                "id='" + id + '\'' +
                ", imoNo='" + imoNo + '\'' +
                ", mmsi='" + mmsi + '\'' +
                ", shipNo='" + shipNo + '\'' +
                ", shipId='" + shipId + '\'' +
                ", registrationNo='" + registrationNo + '\'' +
                ", initialregistrationNo='" + initialregistrationNo + '\'' +
                ", shipsurveyNo='" + shipsurveyNo + '\'' +
                ", cardbook='" + cardbook + '\'' +
                ", icNo='" + icNo + '\'' +
                ", callsign='" + callsign + '\'' +
                ", localName='" + localName + '\'' +
                ", shipNameEn='" + shipNameEn + '\'' +
                ", formerName1='" + formerName1 + '\'' +
                ", formerName2='" + formerName2 + '\'' +
                ", formerName3='" + formerName3 + '\'' +
                ", statusCode='" + statusCode + '\'' +
                ", shiptypeCode='" + shiptypeCode + '\'' +
                ", flagCode='" + flagCode + '\'' +
                ", registrationPort='" + registrationPort + '\'' +
                ", inlandshipMark='" + inlandshipMark + '\'' +
                ", buildDate='" + buildDate + '\'' +
                ", shipyard='" + shipyard + '\'' +
                ", owner='" + owner + '\'' +
                ", contactNO='" + contactNO + '\'' +
                ", operator='" + operator + '\'' +
                ", classificationCode='" + classificationCode + '\'' +
                ", maxSpeed='" + maxSpeed + '\'' +
                ", loa='" + loa + '\'' +
                ", lbp='" + lbp + '\'' +
                ", depth='" + depth + '\'' +
                ", bm='" + bm + '\'' +
                ", draught='" + draught + '\'' +
                ", height='" + height + '\'' +
                ", gross='" + gross + '\'' +
                ", net='" + net + '\'' +
                ", dWT='" + dWT + '\'' +
                ", holds='" + holds + '\'' +
                ", hatch='" + hatch + '\'' +
                ", minFreeboard='" + minFreeboard + '\'' +
                ", windLoading='" + windLoading + '\'' +
                ", slot='" + slot + '\'' +
                ", carport='" + carport + '\'' +
                ", passengerSpaces='" + passengerSpaces + '\'' +
                ", minSafeManningNO='" + minSafeManningNO + '\'' +
                ", maxSurvivalEquipmentNO='" + maxSurvivalEquipmentNO + '\'' +
                ", hullMaterialCode='" + hullMaterialCode + '\'' +
                ", propellerType='" + propellerType + '\'' +
                ", power='" + power + '\'' +
                ", rpm='" + rpm + '\'' +
                ", buildPlace='" + buildPlace + '\'' +
                ", powerType='" + powerType + '\'' +
                ", powerNO='" + powerNO + '\'' +
                ", powerBoreNO='" + powerBoreNO + '\'' +
                ", cylinderBore='" + cylinderBore + '\'' +
                ", powerItinerary='" + powerItinerary + '\'' +
                ", decks='" + decks + '\'' +
                ", ballast='" + ballast + '\'' +
                ", auxiliaryPower='" + auxiliaryPower + '\'' +
                ", powerClass='" + powerClass + '\'' +
                ", dataSource='" + dataSource + '\'' +
                ", lastupdateTime='" + lastupdateTime + '\'' +
                ", deleteFlag='" + deleteFlag + '\'' +
                ", rowVer='" + rowVer + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImoNo() {
        return imoNo;
    }

    public void setImoNo(String imoNo) {
        this.imoNo = imoNo;
    }

    public String getMmsi() {
        return mmsi;
    }

    public void setMmsi(String mmsi) {
        this.mmsi = mmsi;
    }

    public String getShipNo() {
        return shipNo;
    }

    public void setShipNo(String shipNo) {
        this.shipNo = shipNo;
    }

    public String getShipId() {
        return shipId;
    }

    public void setShipId(String shipId) {
        this.shipId = shipId;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public String getInitialregistrationNo() {
        return initialregistrationNo;
    }

    public void setInitialregistrationNo(String initialregistrationNo) {
        this.initialregistrationNo = initialregistrationNo;
    }

    public String getShipsurveyNo() {
        return shipsurveyNo;
    }

    public void setShipsurveyNo(String shipsurveyNo) {
        this.shipsurveyNo = shipsurveyNo;
    }

    public String getCardbook() {
        return cardbook;
    }

    public void setCardbook(String cardbook) {
        this.cardbook = cardbook;
    }

    public String getIcNo() {
        return icNo;
    }

    public void setIcNo(String icNo) {
        this.icNo = icNo;
    }

    public String getCallsign() {
        return callsign;
    }

    public void setCallsign(String callsign) {
        this.callsign = callsign;
    }

    public String getLocalName() {
        return localName;
    }

    public void setLocalName(String localName) {
        this.localName = localName;
    }

    public String getShipNameEn() {
        return shipNameEn;
    }

    public void setShipNameEn(String shipNameEn) {
        this.shipNameEn = shipNameEn;
    }

    public String getFormerName1() {
        return formerName1;
    }

    public void setFormerName1(String formerName1) {
        this.formerName1 = formerName1;
    }

    public String getFormerName2() {
        return formerName2;
    }

    public void setFormerName2(String formerName2) {
        this.formerName2 = formerName2;
    }

    public String getFormerName3() {
        return formerName3;
    }

    public void setFormerName3(String formerName3) {
        this.formerName3 = formerName3;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getShiptypeCode() {
        return shiptypeCode;
    }

    public void setShiptypeCode(String shiptypeCode) {
        this.shiptypeCode = shiptypeCode;
    }

    public String getFlagCode() {
        return flagCode;
    }

    public void setFlagCode(String flagCode) {
        this.flagCode = flagCode;
    }

    public String getRegistrationPort() {
        return registrationPort;
    }

    public void setRegistrationPort(String registrationPort) {
        this.registrationPort = registrationPort;
    }

    public String getInlandshipMark() {
        return inlandshipMark;
    }

    public void setInlandshipMark(String inlandshipMark) {
        this.inlandshipMark = inlandshipMark;
    }

    public String getBuildDate() {
        return buildDate;
    }

    public void setBuildDate(String buildDate) {
        this.buildDate = buildDate;
    }

    public String getShipyard() {
        return shipyard;
    }

    public void setShipyard(String shipyard) {
        this.shipyard = shipyard;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getContactNO() {
        return contactNO;
    }

    public void setContactNO(String contactNO) {
        this.contactNO = contactNO;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getClassificationCode() {
        return classificationCode;
    }

    public void setClassificationCode(String classificationCode) {
        this.classificationCode = classificationCode;
    }

    public String getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(String maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public String getLoa() {
        return loa;
    }

    public void setLoa(String loa) {
        this.loa = loa;
    }

    public String getLbp() {
        return lbp;
    }

    public void setLbp(String lbp) {
        this.lbp = lbp;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getBm() {
        return bm;
    }

    public void setBm(String bm) {
        this.bm = bm;
    }

    public String getDraught() {
        return draught;
    }

    public void setDraught(String draught) {
        this.draught = draught;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getGross() {
        return gross;
    }

    public void setGross(String gross) {
        this.gross = gross;
    }

    public String getNet() {
        return net;
    }

    public void setNet(String net) {
        this.net = net;
    }

    public String getdWT() {
        return dWT;
    }

    public void setdWT(String dWT) {
        this.dWT = dWT;
    }

    public String getHolds() {
        return holds;
    }

    public void setHolds(String holds) {
        this.holds = holds;
    }

    public String getHatch() {
        return hatch;
    }

    public void setHatch(String hatch) {
        this.hatch = hatch;
    }

    public String getMinFreeboard() {
        return minFreeboard;
    }

    public void setMinFreeboard(String minFreeboard) {
        this.minFreeboard = minFreeboard;
    }

    public String getWindLoading() {
        return windLoading;
    }

    public void setWindLoading(String windLoading) {
        this.windLoading = windLoading;
    }

    public String getSlot() {
        return slot;
    }

    public void setSlot(String slot) {
        this.slot = slot;
    }

    public String getCarport() {
        return carport;
    }

    public void setCarport(String carport) {
        this.carport = carport;
    }

    public String getPassengerSpaces() {
        return passengerSpaces;
    }

    public void setPassengerSpaces(String passengerSpaces) {
        this.passengerSpaces = passengerSpaces;
    }

    public String getMinSafeManningNO() {
        return minSafeManningNO;
    }

    public void setMinSafeManningNO(String minSafeManningNO) {
        this.minSafeManningNO = minSafeManningNO;
    }

    public String getMaxSurvivalEquipmentNO() {
        return maxSurvivalEquipmentNO;
    }

    public void setMaxSurvivalEquipmentNO(String maxSurvivalEquipmentNO) {
        this.maxSurvivalEquipmentNO = maxSurvivalEquipmentNO;
    }

    public String getHullMaterialCode() {
        return hullMaterialCode;
    }

    public void setHullMaterialCode(String hullMaterialCode) {
        this.hullMaterialCode = hullMaterialCode;
    }

    public String getPropellerType() {
        return propellerType;
    }

    public void setPropellerType(String propellerType) {
        this.propellerType = propellerType;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public String getRpm() {
        return rpm;
    }

    public void setRpm(String rpm) {
        this.rpm = rpm;
    }

    public String getBuildPlace() {
        return buildPlace;
    }

    public void setBuildPlace(String buildPlace) {
        this.buildPlace = buildPlace;
    }

    public String getPowerType() {
        return powerType;
    }

    public void setPowerType(String powerType) {
        this.powerType = powerType;
    }

    public String getPowerNO() {
        return powerNO;
    }

    public void setPowerNO(String powerNO) {
        this.powerNO = powerNO;
    }

    public String getPowerBoreNO() {
        return powerBoreNO;
    }

    public void setPowerBoreNO(String powerBoreNO) {
        this.powerBoreNO = powerBoreNO;
    }

    public String getCylinderBore() {
        return cylinderBore;
    }

    public void setCylinderBore(String cylinderBore) {
        this.cylinderBore = cylinderBore;
    }

    public String getPowerItinerary() {
        return powerItinerary;
    }

    public void setPowerItinerary(String powerItinerary) {
        this.powerItinerary = powerItinerary;
    }

    public String getDecks() {
        return decks;
    }

    public void setDecks(String decks) {
        this.decks = decks;
    }

    public String getBallast() {
        return ballast;
    }

    public void setBallast(String ballast) {
        this.ballast = ballast;
    }

    public String getAuxiliaryPower() {
        return auxiliaryPower;
    }

    public void setAuxiliaryPower(String auxiliaryPower) {
        this.auxiliaryPower = auxiliaryPower;
    }

    public String getPowerClass() {
        return powerClass;
    }

    public void setPowerClass(String powerClass) {
        this.powerClass = powerClass;
    }

    public String getDataSource() {
        return dataSource;
    }

    public void setDataSource(String dataSource) {
        this.dataSource = dataSource;
    }

    public String getLastupdateTime() {
        return lastupdateTime;
    }

    public void setLastupdateTime(String lastupdateTime) {
        this.lastupdateTime = lastupdateTime;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getRowVer() {
        return rowVer;
    }

    public void setRowVer(String rowVer) {
        this.rowVer = rowVer;
    }


}
