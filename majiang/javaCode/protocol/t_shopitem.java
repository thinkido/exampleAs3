package protocol;
// Generated by proto2javame, Wed Jan 13 00:12:46 CST 2016.

import java.io.IOException;
import java.io.InputStream;


import net.jarlehansen.protobuf.javame.input.InputReader;
import net.jarlehansen.protobuf.javame.input.DelimitedInputStream;
import net.jarlehansen.protobuf.javame.input.DelimitedSizeUtil;
import net.jarlehansen.protobuf.javame.ComputeSizeUtil;
import net.jarlehansen.protobuf.javame.output.OutputWriter;
import net.jarlehansen.protobuf.javame.AbstractOutputWriter;
import net.jarlehansen.protobuf.javame.input.taghandler.UnknownTagHandler;
import net.jarlehansen.protobuf.javame.input.taghandler.DefaultUnknownTagHandlerImpl;

public final class t_shopitem extends AbstractOutputWriter {
	private static UnknownTagHandler unknownTagHandler = DefaultUnknownTagHandlerImpl.newInstance();

	private final int id;
	private static final int fieldNumberId = 1;
	private final boolean hasId;

	private final int shopid;
	private static final int fieldNumberShopid = 2;
	private final boolean hasShopid;

	private final String productid;
	private static final int fieldNumberProductid = 3;
	private final boolean hasProductid;

	private final t_checkout checkout;
	private static final int fieldNumberCheckout = 4;
	private final boolean hasCheckout;

	private final int discount;
	private static final int fieldNumberDiscount = 7;
	private final boolean hasDiscount;

	private final int vip_discount;
	private static final int fieldNumberVip_discount = 8;
	private final boolean hasVip_discount;


	public static Builder newBuilder() {
		return new Builder();
	}

	private t_shopitem(final Builder builder) {
			this.id = builder.id;
			this.hasId = builder.hasId;
			this.shopid = builder.shopid;
			this.hasShopid = builder.hasShopid;
			this.productid = builder.productid;
			this.hasProductid = builder.hasProductid;
			this.checkout = builder.checkout;
			this.hasCheckout = builder.hasCheckout;
			this.discount = builder.discount;
			this.hasDiscount = builder.hasDiscount;
			this.vip_discount = builder.vip_discount;
			this.hasVip_discount = builder.hasVip_discount;
			}

	public static class Builder {
		private int id;
		private boolean hasId = false;

		private int shopid;
		private boolean hasShopid = false;

		private String productid;
		private boolean hasProductid = false;

		private t_checkout checkout;
		private boolean hasCheckout = false;

		private int discount;
		private boolean hasDiscount = false;

		private int vip_discount;
		private boolean hasVip_discount = false;


		private Builder() {
		}

		public Builder setId(final int id) {
			this.id = id;
			this.hasId = true;
			return this;
		}

		public Builder setShopid(final int shopid) {
			this.shopid = shopid;
			this.hasShopid = true;
			return this;
		}

		public Builder setProductid(final String productid) {
			this.productid = productid;
			this.hasProductid = true;
			return this;
		}

		public Builder setCheckout(final t_checkout checkout) {
			this.checkout = checkout;
			this.hasCheckout = true;
			return this;
		}

		public Builder setDiscount(final int discount) {
			this.discount = discount;
			this.hasDiscount = true;
			return this;
		}

		public Builder setVip_discount(final int vip_discount) {
			this.vip_discount = vip_discount;
			this.hasVip_discount = true;
			return this;
		}

		public t_shopitem build() {
			return new t_shopitem(this);
		}
	}

	public int getId() {
		return id;
	}

	public boolean hasId() {
		return hasId;
	}

	public int getShopid() {
		return shopid;
	}

	public boolean hasShopid() {
		return hasShopid;
	}

	public String getProductid() {
		return productid;
	}

	public boolean hasProductid() {
		return hasProductid;
	}

	public t_checkout getCheckout() {
		return checkout;
	}

	public boolean hasCheckout() {
		return hasCheckout;
	}

	public int getDiscount() {
		return discount;
	}

	public boolean hasDiscount() {
		return hasDiscount;
	}

	public int getVip_discount() {
		return vip_discount;
	}

	public boolean hasVip_discount() {
		return hasVip_discount;
	}

	public String toString() {
		final String TAB = "   ";
		String retValue = "";
		retValue += this.getClass().getName() + "(";
		if(hasId) retValue += "id = " + this.id + TAB;
		if(hasShopid) retValue += "shopid = " + this.shopid + TAB;
		if(hasProductid) retValue += "productid = " + this.productid + TAB;
		if(hasCheckout) retValue += "checkout = " + this.checkout + TAB;
		if(hasDiscount) retValue += "discount = " + this.discount + TAB;
		if(hasVip_discount) retValue += "vip_discount = " + this.vip_discount + TAB;
		retValue += ")";

		return retValue;
	}

	// Override
	public int computeSize() {
		int totalSize = 0;
		if(hasId) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberId, id);
		if(hasShopid) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberShopid, shopid);
		if(hasProductid) totalSize += ComputeSizeUtil.computeStringSize(fieldNumberProductid, productid);
		if(hasDiscount) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberDiscount, discount);
		if(hasVip_discount) totalSize += ComputeSizeUtil.computeIntSize(fieldNumberVip_discount, vip_discount);
		totalSize += computeNestedMessageSize();

		return totalSize;
	}

	private int computeNestedMessageSize() {
		int messageSize = 0;
		if(hasCheckout) messageSize += ComputeSizeUtil.computeMessageSize(fieldNumberCheckout, checkout.computeSize());

		return messageSize;
	}

	// Override
	public void writeFields(final OutputWriter writer) throws IOException {
		if(hasId) writer.writeInt(fieldNumberId, id);
		if(hasShopid) writer.writeInt(fieldNumberShopid, shopid);
		if(hasProductid) writer.writeString(fieldNumberProductid, productid);
		if(hasCheckout) { writer.writeMessage(fieldNumberCheckout, checkout.computeSize()); checkout.writeFields(writer); }
		if(hasDiscount) writer.writeInt(fieldNumberDiscount, discount);
		if(hasVip_discount) writer.writeInt(fieldNumberVip_discount, vip_discount);
	}

	static t_shopitem parseFields(final InputReader reader) throws IOException {
		int nextFieldNumber = getNextFieldNumber(reader);
		final t_shopitem.Builder builder = t_shopitem.newBuilder();

		while (nextFieldNumber > 0) {
			if(!populateBuilderWithField(reader, builder, nextFieldNumber)) {
				reader.getPreviousTagDataTypeAndReadContent();
			}
			nextFieldNumber = getNextFieldNumber(reader);
		}

		return builder.build();
	}

	static int getNextFieldNumber(final InputReader reader) throws IOException {
		return reader.getNextFieldNumber();
	}

	static boolean populateBuilderWithField(final InputReader reader, final Builder builder, final int fieldNumber) throws IOException {
		boolean fieldFound = true;
		switch (fieldNumber) {
			case fieldNumberId:
				builder.setId(reader.readInt(fieldNumber));
				break;
			case fieldNumberShopid:
				builder.setShopid(reader.readInt(fieldNumber));
				break;
			case fieldNumberProductid:
				builder.setProductid(reader.readString(fieldNumber));
				break;
			case fieldNumberCheckout:
			 java.util.Vector vcCheckout = reader.readMessages(fieldNumberCheckout);
				for(int i = 0 ; i < vcCheckout.size(); i++) {
					byte[] eachBinData = (byte[]) vcCheckout.elementAt(i);
					t_checkout.Builder builderCheckout = t_checkout.newBuilder();
					InputReader innerInputReader = new InputReader(eachBinData, unknownTagHandler);
					boolean boolCheckout = true;
					int nestedFieldCheckout = -1;
					while(boolCheckout) {
						nestedFieldCheckout = getNextFieldNumber(innerInputReader);
						boolCheckout = t_checkout.populateBuilderWithField(innerInputReader, builderCheckout, nestedFieldCheckout);
					}
					eachBinData = null;
					innerInputReader = null;
					builder.setCheckout(builderCheckout.build());
				}
				break;
			case fieldNumberDiscount:
				builder.setDiscount(reader.readInt(fieldNumber));
				break;
			case fieldNumberVip_discount:
				builder.setVip_discount(reader.readInt(fieldNumber));
				break;
		default:
			fieldFound = false;
		}
		return fieldFound;
	}

	public static void setUnknownTagHandler(final UnknownTagHandler unknownTagHandler) {
		t_shopitem.unknownTagHandler = unknownTagHandler;
	}

	public static t_shopitem parseFrom(final byte[] data) throws IOException {
		return parseFields(new InputReader(data, unknownTagHandler));
	}

	public static t_shopitem parseFrom(final InputStream inputStream) throws IOException {
		return parseFields(new InputReader(inputStream, unknownTagHandler));
	}

	public static t_shopitem parseDelimitedFrom(final InputStream inputStream) throws IOException {
		final int limit = DelimitedSizeUtil.readDelimitedSize(inputStream);
		return parseFields(new InputReader(new DelimitedInputStream(inputStream, limit), unknownTagHandler));
	}
}